import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/providers/work_provider.dart';

class ReportRepository {
  final ReportProvider reportProvider;

  ReportRepository({required this.reportProvider});

  Future<QuerySnapshot> getReports(String workId) async {
    return await reportProvider.getReports(workId);
  }

  Future<Report> createReport(
      String workServerId, String title, String content) async {
    return await reportProvider.createReport(workServerId, title, content);
  }
}
