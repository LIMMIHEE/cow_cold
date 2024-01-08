import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/data/models/work/work.dart';
import 'package:cow_cold/data/source/local/storage.dart';
import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class WorkProvider {
  final FirebaseDatabase dataBase = FirebaseDataBase.instance.database;
  final FirebaseStore firebaseStore = FirebaseStore.instance;
  final String userId = Get.find<UserController>().userId;

  Future<QuerySnapshot> getWorks() async {
    return await firebaseStore.store
        .collection('work')
        .where("createUserId", isEqualTo: userId)
        .get();
  }

  Future<QuerySnapshot?> getInviteWork() async {
    final List<String> inviteWorks =
        List<String>.from(await Storage.readList(Storage.inviteWork));
    if (inviteWorks.isNotEmpty) {
      return await firebaseStore.store
          .collection('work')
          .where("inviteCode", whereIn: inviteWorks)
          .get();
    } else {
      return null;
    }
  }

  Future<QuerySnapshot> getWorkInviteCode(String inviteCode) async {
    return await firebaseStore.store
        .collection('work')
        .where("inviteCode", isEqualTo: inviteCode)
        .get();
  }

  Future<Work> createWork(Work work) async {
    final newWork = firebaseStore.store.collection("work").doc();
    final inviteCode = generateInviteCode(newWork.id);

    await newWork.set(work
        .copyWith(
          serverId: newWork.id,
          createUserId: userId,
          createUserName: Prefs.getString(Prefs.nickName),
          inviteCode: inviteCode,
        )
        .toJson());
    await setInviteCodeWork(newWork.id, inviteCode);
    return work;
  }

  Future<void> updateWork(Work work) async {
    await firebaseStore.store
        .collection("work")
        .doc(work.serverId)
        .update(work.toJson());
  }

  Future<void> deleteWork(String serverId, String inviteCode) async {
    await firebaseStore.store.collection("work").doc(serverId).delete();
    await dataBase.ref('work').child(inviteCode).remove();
  }

  Future<void> setInviteCodeWork(String workServerId, String inviteCode) async {
    await dataBase.ref('work').child(inviteCode).set({
      'workServerId': workServerId,
      'allowedUsers': [userId],
    });
  }

  Future<void> submitInviteCode(String inviteCode) async {
    final work = dataBase.ref('work').child(inviteCode);

    final DataSnapshot snapshot = await work.child("allowedUsers").get();

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
