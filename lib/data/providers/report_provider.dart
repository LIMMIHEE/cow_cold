import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';

class ReportProvider {
  final firebaseStore = FirebaseStore.instance;

  Future<QuerySnapshot> getUserReports() async {
    final userId = PrefsUtils.getString(PrefsUtils.userId);
    return await firebaseStore.store
        .collection("report")
        .where("createUserId", isEqualTo: userId)
        .get();
  }

  Future<QuerySnapshot> getInviteWorkReports(String workServerId) async {
    return await firebaseStore.store
        .collection("report")
        .where("workServerId", isEqualTo: workServerId)
        .get();
  }

  Future<Report> createReport(Report report) async {
    final newReport = firebaseStore.store.collection("report").doc();

    report.serverId = newReport.id;
    report.createUserId = PrefsUtils.getString(PrefsUtils.userId);
    report.createUserName = PrefsUtils.getString(PrefsUtils.nickName);

    await newReport.set(report.toJson());
    return report;
  }

  Future<void> updateReport(Report report) async {
    await firebaseStore.store
        .collection("report")
        .doc(report.serverId)
        .update(report.toJson());
  }

  Future<void> deleteReport(String serverId) async {
    await firebaseStore.store.collection("report").doc(serverId).delete();
  }

  Future<void> deleteReports(String workServerId) async {
    try {
      final QuerySnapshot deleteReport = await firebaseStore.store
          .collection("report")
          .where("workServerId", isEqualTo: workServerId)
          .get();

      await Future.wait(
        deleteReport.docs.map((report) async {
          if (report.exists) {
            await firebaseStore.store
                .collection("report")
                .doc(report.id)
                .delete();
          }
        }),
      );
    } catch (e) {
      rethrow;
    }
  }
}
