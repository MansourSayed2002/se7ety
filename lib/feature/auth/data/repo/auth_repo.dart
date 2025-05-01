import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/class/supabase_connection.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';
import 'package:se7ety/core/constants/enum/type_user.dart';
import 'package:se7ety/core/function/get_token.dart';

class AuthRepo {
  static register(
    String emailAddress,
    String password,
    String displayName,
    TypeUser typeuser,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      String uid = credential.user!.uid;
      String token = await getToken();
      LocalStorageApp.saveData("uid", uid);
      LocalStorageApp.saveData("token", token);
      await credential.user!.updateDisplayName(displayName);
      await FirebaseFirestore.instance
          .collection(typeuser == TypeUser.doctor ? "doctor" : "patient")
          .doc(uid)
          .set(
            typeuser == TypeUser.doctor
                ? {
                  "name": displayName,
                  "email": emailAddress,
                  "uid": uid,
                  "bio": '',
                  "age": '',
                  "image": '',
                  "phone1": '',
                  "phone2": '',
                  "address": '',
                  "openHour": '',
                  "closeHour": '',
                  "specialization": '',
                  "rating": 0,
                  "token": token,
                }
                : {
                  "name": displayName,
                  "email": emailAddress,
                  "uid": uid,
                  "phone": '',
                  "city": '',
                  "bio": '',
                  "age": '',
                  "image": '',
                  "token": token,
                },
          );
      return StatusRequest.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(e.code);
        return StatusRequest.failureWeakPassword;
      } else if (e.code == 'email-already-in-use') {
        log(e.code);
        return StatusRequest.failureEmailExists;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String uid = credential.user!.uid;
      String token = await getToken();
      LocalStorageApp.saveData("uid", uid);
      LocalStorageApp.saveData("token", token);
      return StatusRequest.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log(e.code);
        return StatusRequest.failureEmialNotExists;
      } else if (e.code == 'wrong-password') {
        log(e.code);
        return StatusRequest.failurePasswordWrong;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static completeRegisterDoc(Map<Object, Object?> doctorData) async {
    try {
      await FirebaseFirestore.instance
          .collection("doctor")
          .doc(LocalStorageApp.getData('uid'))
          .update(doctorData);
      return StatusRequest.success;
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static upLoadImage(path, filepath) async {
    await SupabaseConnection.upLoadImage(path, filepath);
  }

  static upLoadLocation(latitude, longitude) async {
    try {
      await FirebaseFirestore.instance
          .collection("doctor")
          .doc(LocalStorageApp.getData('uid'))
          .update({"latitude": latitude ?? 0, "longitude": longitude ?? 0});
      return StatusRequest.success;
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}
