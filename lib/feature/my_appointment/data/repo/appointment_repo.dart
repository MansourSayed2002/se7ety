import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';

class AppointmentRepo {
  static Future<QuerySnapshot<Map<String, dynamic>>> getAppointment() async {
    final date = DateTime.now().toString().split(" ").first;
    return await FirebaseFirestore.instance
        .collection("appointments")
        .where("patientId", isEqualTo: LocalStorageApp.getData("uid"))
        .where("isDone", isEqualTo: false)
        .where("date", isEqualTo: date)
        .orderBy("date", descending: false)
        .orderBy("time", descending: false)
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
}
