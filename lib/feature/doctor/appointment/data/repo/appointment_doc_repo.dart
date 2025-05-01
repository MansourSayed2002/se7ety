import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';

class AppointmentDocRepo {
  static Future<QuerySnapshot<Map<String, dynamic>>> getAppointment() async {
    return await FirebaseFirestore.instance
        .collection("appointments")
        .where("doctorId", isEqualTo: LocalStorageApp.getData("uid"))
        .where("isDone", isEqualTo: false)
        .get();
  }

  static deleteAppointment(String document) async {
    try {
      await FirebaseFirestore.instance
          .collection("appointments")
          .doc(document)
          .delete();
      return StatusRequest.success;
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static doneAppointment(String document) async {
    try {
      await FirebaseFirestore.instance
          .collection("appointments")
          .doc(document)
          .update({"isDone": true});
      return StatusRequest.success;
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}
