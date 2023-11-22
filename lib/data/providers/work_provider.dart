import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WorkProvider {
  final FirebaseDatabase dataBase = FirebaseDataBase.instance.database;
  final FirebaseStore firebaseStore = FirebaseStore.instance;

  Future<QuerySnapshot> getWork() async {
    final userId = PrefsUtils.getString(PrefsUtils.userId);
    return await firebaseStore.store
        .collection('work')
        .where("createUserId", isEqualTo: userId)
        .get();
  }

  Future<Work> createWork(
      String title, String category, String description) async {
    final newWork = firebaseStore.store.collection("work").doc();
    final inviteCode = generateInviteCode(newWork.id);

    final work = Work(
      serverId: newWork.id,
      createUserId: PrefsUtils.getString(PrefsUtils.userId),
      createUserName: PrefsUtils.getString(PrefsUtils.nickName),
      updateDate: DateTime.now().toString(),
      title: title,
      category: category,
      description: description,
      inviteCode: inviteCode,
    );

    await newWork.set(work.toJson());
    await setInviteCodeWork(newWork.id, inviteCode);
    return work;
  }

  Future<void> deleteWork(String serverId) async {
    await firebaseStore.store.collection("work").doc(serverId).delete();
  }

  Future<void> setInviteCodeWork(String workServerId, String inviteCode) async {
    await dataBase.ref('work').child(workServerId).set({
      'inviteCode': inviteCode,
      'allowedUsers': [],
    });
  }

  Future<void> updateAllowedUsers(
      String workServerId, List<String> allowedUsers) async {
    await dataBase.ref('work').child(workServerId).update({
      'allowedUsers': allowedUsers,
    });
  }

  String generateInviteCode(String workId) {
    final uniqueKey = dotenv.env['INVITE_UNIQUE_KEY'] ?? '';
    final codeSource = "$workId$uniqueKey";
    return sha1.convert(utf8.encode(codeSource)).toString().substring(0, 10);
  }
}
