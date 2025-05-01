import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/function/handling_rating.dart';

class HomeRepo {
  static Future<QuerySnapshot<Map<String, dynamic>>> getDoctorsRating() async {
    return await FirebaseFirestore.instance
        .collection("doctor")
        .where("specialization", isNotEqualTo: "")
        .orderBy("rating", descending: true)
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
  getDoctorsThroughSpecialization(specialization) async {
    return await FirebaseFirestore.instance
        .collection("doctor")
        .where("specialization", isEqualTo: specialization)
        .get();
  }

  static checkRating() async {
    try {
      var result =
          await FirebaseFirestore.instance
              .collection("appointments")
              .where("patientId", isEqualTo: LocalStorageApp.getData("uid"))
              .where("rating", isEqualTo: 0)
              .limit(1)
              .get();
      if (result.docs.isNotEmpty) {
        return result.docs.first.id;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static updateRating(String document, double rating) async {
    try {
      await FirebaseFirestore.instance
          .collection("appointments")
          .doc(document)
          .update({"rating": rating});
      docRating();
    } catch (e) {
      log(e.toString());
    }
  }

  static docRating() async {
    try {
      var result =
          await FirebaseFirestore.instance
              .collection("appointments")
              .where("patientId", isEqualTo: LocalStorageApp.getData("uid"))
              .get();
      int member = calculatingClients(result.docs);
      num totalRating = calculatingRating(result.docs);
      num rating = totalRating / member;
      await FirebaseFirestore.instance
          .collection("doctor")
          .doc(result.docs.first["doctorId"])
          .update({"rating": rating});
    } catch (e) {
      log(e.toString());
    }
  }
}
