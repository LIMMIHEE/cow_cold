import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/user/user.dart';
import 'package:cow_cold/data/source/local/storage.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';

class UserProvider {
  final FirebaseStore firebaseStore = FirebaseStore.instance;

  Future<void> setUser(User user) async {
    final serverId = firebaseStore.store.collection("user").doc().id;

    await firebaseStore.store
        .collection("user")
        .doc(serverId)
        .set(user.copyWith(serverId: serverId).toJson());
  }

  Future<void> addCategory(String category) async {
    final user = await _getUserAndUpdate();

    await _updateUser(
        user.copyWith(customCategory: [...user.customCategory, category]));
  }

  Future<void> addInviteWork(String inviteCode) async {
    final user = await _getUserAndUpdate();

    final List<String> inviteWorks =
        List<String>.from(await Storage.readList(Storage.inviteWork));
    Storage.writeList(Storage.inviteWork, [...inviteWorks, inviteCode]);

    await _updateUser(
        user.copyWith(inviteWorks: [...user.inviteWorks, inviteCode]));
  }

  Future<User> _getUserAndUpdate() async {
    final id = await Storage.read(Storage.email) ?? '';
    final userQuery = await getUser(id);

    final user = convertUser(userQuery);
    return user;
  }

  Future<QuerySnapshot> getUser(String email) async {
    return await firebaseStore.store
        .collection("user")
        .where("id", isEqualTo: email)
        .get();
  }

  User convertUser(QuerySnapshot userQuery) {
    return User.fromJson(jsonDecode(jsonEncode(userQuery.docs.first.data())));
  }

  Future<void> _updateUser(User user) async {
    await firebaseStore.store
        .collection("user")
        .doc(user.serverId)
        .update(user.toJson());
  }
}
