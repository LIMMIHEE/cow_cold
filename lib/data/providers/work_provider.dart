import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class WorkProvider {
  final FirebaseDatabase dataBase = FirebaseDataBase.instance.database;
  final FirebaseStore firebaseStore = FirebaseStore.instance;

  Future<QuerySnapshot> getWorks() async {
    final userId = PrefsUtils.getString(PrefsUtils.userId);
    return await firebaseStore.store
        .collection('work')
        .where("createUserId", isEqualTo: userId)
        .get();
  }

  Future<QuerySnapshot> getInviteWork() async {
    final inviteWorks = PrefsUtils.getStringList(PrefsUtils.inviteWork);

    return await firebaseStore.store
        .collection('work')
        .where("inviteCode", whereIn: inviteWorks)
        .get();
  }

  Future<QuerySnapshot> getWorkInviteCode(String inviteCode) async {
    return await firebaseStore.store
        .collection('work')
        .where("inviteCode", isEqualTo: inviteCode)
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

  Future<void> deleteWork(String serverId, String inviteCode) async {
    await firebaseStore.store.collection("work").doc(serverId).delete();
    await dataBase.ref('work').child(inviteCode).remove();
  }

  Future<void> setInviteCodeWork(String workServerId, String inviteCode) async {
    final userId = PrefsUtils.getString(PrefsUtils.userId);
    await dataBase.ref('work').child(inviteCode).set({
      'workServerId': workServerId,
      'allowedUsers': [userId],
    });
  }

  Future<void> submitInviteCode(String inviteCode) async {
    final work = dataBase.ref('work').child(inviteCode);

    final DataSnapshot snapshot = await work.child("allowedUsers").get();
    final userId = PrefsUtils.getString(PrefsUtils.userId);

    if (snapshot.exists) {
      final allowedUsers = snapshot.value as List;

      if (allowedUsers.contains(userId)) {
        Get.snackbar('추가 불가', '이미 추가된 작품 입니다.');
        return;
      } else {
        await work.set({
          "allowedUsers": [...allowedUsers, userId]
        });
      }
    } else {
      await work.set({
        "allowedUsers": [userId]
      });
    }
  }

  String generateInviteCode(String workId) {
    final uniqueKey = dotenv.env['INVITE_UNIQUE_KEY'] ?? '';
    final codeSource = "$workId$uniqueKey";
    return sha1.convert(utf8.encode(codeSource)).toString().substring(0, 10);
  }
}
