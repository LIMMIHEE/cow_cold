import 'package:cloud_firestore/cloud_firestore.dart';

class TestRepository {
  final FirebaseFirestore firestore;
  TestRepository({required this.firestore});

  Future<QuerySnapshot> fetchCollection(String collection,
      {String? doc}) async {
    return await firestore.collection(collection).get();
  }

  Future<DocumentSnapshot> fetchDocs(String collection, String doc) async {
    return await firestore.collection(collection).doc(doc).get();
  }
}
