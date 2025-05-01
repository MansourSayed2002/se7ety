import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRepo {
  static Stream<QuerySnapshot<Map<String, dynamic>>> searchingAboutDoc(
    String name,
  ) {
    return FirebaseFirestore.instance
        .collection("doctor")
        .where("specialization", isNotEqualTo: "")
        .orderBy("name")
        .startAt([name])
        .endAt(['$name\uf8ff'])
        .snapshots();
  }
}
