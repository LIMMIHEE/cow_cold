import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';

class UserProvider {
  final FirebaseStore firebaseStore = FirebaseStore.instance;

  Future<void> setUser(User user) async {
    final newUser = await firebaseStore.store.collection("user").doc();
    user.serverId = newUser.id;

    await newUser.set(user.toJson());
  }

  Future<QuerySnapshot> getUser(String email) async {
    return await firebaseStore.store
        .collection("user")
        .where("id", isEqualTo: email)
        .get();
  }
}
