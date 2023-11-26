import 'dart:convert';
import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ReportRepository _reportRepository =
      ReportRepository(reportProvider: ReportProvider());

  RxList<Report> myReports = <Report>[].obs;
  RxMap<String, List<Report>> inviteWorkReports = <String, List<Report>>{}.obs;
  final String userId = PrefsUtils.getString(PrefsUtils.userId);

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadReports();
  }

  Future<void> _loadReports() async {
    try {
      final reports = await _reportRepository.getUserReports();
      final getReports = reports.docs
          .map((report) =>
              Report.fromJson(jsonDecode(jsonEncode(report.data()))))
          .toList();

      myReports.assignAll(
          getReports..sort((a, b) => b.updateDate.compareTo(a.updateDate)));
    } catch (e) {
      _showErrorSnackbar();
    }
  }

  Future<void> loadInviteWorkReport(Work work) async {
    try {
      if (inviteWorkReports.keys.contains(work.serverId)) {
        return;
      }

      final result =
          await _reportRepository.getInviteWorkReports(work.serverId);
      final getReports = result.docs
          .map((report) =>
              Report.fromJson(jsonDecode(jsonEncode(report.data()))))
          .toList();
      inviteWorkReports[work.serverId] = getReports;
    } catch (e) {
      _showErrorSnackbar();
    }
  }

  List<Report> getWorkReport(String workId) {
    return myReports.where((report) => report.workServerId == workId).toList();
  }

  List<Report>? getInviteWorkReport(String workId) {
    return inviteWorkReports[workId]
        ?.where((report) => report.createUserId != userId)
        .toList();
  }

  void addReport(Report newReport) {
    myReports.add(newReport);
  }

  Future<void> updateReport(Report report) async {
    myReports[myReports
        .indexWhere((element) => element.serverId == report.serverId)] = report;
  }

  Future<void> deleteReport(Report report) async {
    await _reportRepository.deleteReport(report.serverId);
    myReports.remove(report);
  }

  Future<void> deleteReports(String workServerId) async {
    await _reportRepository.deleteReports(workServerId);
  }

  void _showErrorSnackbar() {
    Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
  }
}
