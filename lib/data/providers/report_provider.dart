import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/source/network/firebase_database.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReportProvider {
  final firebaseStore = FirebaseStore.instance;

  Future<QuerySnapshot> getUserReports() async {
    return await firebaseStore.store
        .collection("report")
        .where("createUserId",
            isEqualTo: PrefsUtils.getString(PrefsUtils.userId))
        .get();
  }

  Future<Report> createReport(
      String workServerId, String title, String content) async {
    final newReport = await firebaseStore.store.collection("report").doc();

    final report = Report(
        serverId: newReport.id,
        workServerId: workServerId,
        createUserId: PrefsUtils.getString(PrefsUtils.userId),
        createUserName: PrefsUtils.getString(PrefsUtils.nickName),
        updateDate: DateTime.now().toString(),
        title: title,
        content: content);

    await newReport.set(report.toJson());
    return report;
  }
}
