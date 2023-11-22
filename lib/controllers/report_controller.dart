import 'dart:convert';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ReportRepository _reportRepository =
      ReportRepository(reportProvider: ReportProvider());

  RxList<Report> reportList = <Report>[].obs;

  @override
  void onReady() async {
    super.onReady();
    try {
      final reports = await _reportRepository.getUserReports();
      final getReports = reports.docs
          .map((report) =>
              Report.fromJson(jsonDecode(jsonEncode(report.data()))))
          .toList();

      reportList
        ..sort((b, a) => a.updateDate.compareTo(b.updateDate))
        ..addAll(getReports);
    } catch (e) {
      Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
    }
  }

  List<Report> getWorkReport(String workId) {
    return reportList.where((report) => report.workServerId == workId).toList();
  }

  void addReport(Report newReport) {
    reportList.add(newReport);
  }

  Future<void> deleteReport(Report report) async {
    await _reportRepository.deleteReport(report.serverId);
    reportList.remove(report);
  }

  Future<void> deleteReports(String workServerId) async {
    await _reportRepository.deleteReports(workServerId);
  }
}
