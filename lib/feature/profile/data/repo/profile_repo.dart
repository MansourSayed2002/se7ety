import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se7ety/core/class/local_storage_app.dart';

class ProfileRepo {
  static Future<DocumentSnapshot<Map<String, dynamic>>> getProfileData() async {
    var res =
        await FirebaseFirestore.instance
            .collection("patient")
            .doc(LocalStorageApp.getData("uid"))
            .get();
    print(res.data());
    return await FirebaseFirestore.instance
        .collection("patient")
        .doc(LocalStorageApp.getData("uid"))
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAppointment() async {
    return await FirebaseFirestore.instance
        .collection("appointments")
        .where("patientId", isEqualTo: LocalStorageApp.getData("uid"))
        .where("isDone", isEqualTo: true)
        .get();
  }
}
