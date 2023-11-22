import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/user.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';

class UserProvider {
  final FirebaseStore firebaseStore = FirebaseStore.instance;

  Future<void> setUser(User user) async {
    user.serverId = firebaseStore.store.collection("user").doc().id;

    await firebaseStore.store
        .collection("user")
        .doc(user.serverId)
        .set(user.toJson());
  }

  Future<void> addCategory(String category) async {
    final id = PrefsUtils.getString(PrefsUtils.email);
    final userQuery = await getUser(id);

    final convertUser =
        User.fromJson(jsonDecode(jsonEncode(userQuery.docs.first.data())));
    convertUser.customCategory = [...convertUser.customCategory, category];

    await firebaseStore.store
        .collection("user")
        .doc(convertUser.serverId)
        .update(convertUser.toJson());
  }

  Future<QuerySnapshot> getUser(String email) async {
    return await firebaseStore.store
        .collection("user")
        .where("id", isEqualTo: email)
        .get();
  }
}
