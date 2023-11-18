import 'dart:convert';

import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
import 'package:get/get.dart';

class ReportHistoryController extends GetxController {
  final ReportRepository _reportRepository =
      ReportRepository(reportProvider: ReportProvider());

  RxList<Report> reportList = <Report>[].obs;

  @override
  void onReady() {
    super.onReady();
    _reportRepository.getUserReports().then((reports) {
      final List<Report> getReports = [];
      for (final report in reports.docs) {
        getReports.add(Report.fromJson(jsonDecode(jsonEncode(report.data()))));
      }

      reportList.addAll(getReports);
    }).onError((error, stackTrace) {
      Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
    });
  }

  List<Report> getWorkReport(String workId) {
    return reportList.value
        .where((report) => report.workServerId == workId)
        .toList();
  }

  void addReport(Report newReport) {
    reportList.add(newReport);
  }
}
