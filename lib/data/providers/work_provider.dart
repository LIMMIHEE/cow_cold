import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WorkProvider {
  final dataBase = FirebaseDataBase.instance.database;
  final firebaseStore = FirebaseStore.instance;

  Future<QuerySnapshot> getWork() async {
    return await firebaseStore.store
        .collection('work')
        .where("createUserId",
            isEqualTo: PrefsUtils.getString(PrefsUtils.userId))
        .get();
  }

  Future<Work> createWork(
      String title, String category, String description) async {
    final newWork = await firebaseStore.store.collection("work").doc();
    final inviteCode = sha1
        .convert(utf8.encode("${newWork.id}${dotenv.env['INVITE_UNIQUE_KEY']}"))
        .toString()
        .substring(0, 10);

    final work = Work(
        serverId: newWork.id,
        createUserId: PrefsUtils.getString(PrefsUtils.userId),
        createUserName: PrefsUtils.getString(PrefsUtils.nickName),
        updateDate: DateTime.now().toString(),
        title: title,
        category: category,
        description: description,
        inviteCode: inviteCode);
    setInviteCodeWork(newWork.id, inviteCode);

    await newWork.set(work.toJson());
    return work;
  }

  Future<void> setInviteCodeWork(String workServerId, String inviteCode) async {
    return await dataBase
        .ref('work')
        .child(workServerId)
        .set({'inviteCode': inviteCode, 'allowedUsers': []});
  }

  Future<void> updateAllowedUsers(
      String workServerId, List<String> allowedUsers) async {
    return await dataBase
        .ref('work')
        .child(workServerId)
        .update({'allowedUsers': allowedUsers});
  }
}
