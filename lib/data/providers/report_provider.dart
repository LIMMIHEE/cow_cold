import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:cow_cold/data/source/network/firebase_store.dart';
import 'package:get/get.dart';

class ReportProvider {
  final firebaseStore = FirebaseStore.instance;
  final String userId = Get.find<UserController>().userId;

  Future<QuerySnapshot> getUserReports() async {
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

    await newReport.set(report
        .copyWith(
          serverId: newReport.id,
          createUserId: userId,
          createUserName: Prefs.getString(Prefs.nickName),
        )
        .toJson());
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
