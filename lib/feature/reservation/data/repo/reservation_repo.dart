import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';

class ReservationRepo {
  static reservationDone(data) async {
    try {
      await FirebaseFirestore.instance
          .collection("appointments")
          .doc()
          .set(data);
      return StatusRequest.success;
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  
}
