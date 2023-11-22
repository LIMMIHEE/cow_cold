import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/providers/report_provider.dart';

class ReportRepository {
  final ReportProvider reportProvider;

  ReportRepository({required this.reportProvider});

  Future<QuerySnapshot> getUserReports() async {
    return await reportProvider.getUserReports();
  }

  Future<Report> createReport(
      String workServerId, String title, String content) async {
    return await reportProvider.createReport(workServerId, title, content);
  }

  Future<void> deleteReport(String serverId) async {
    return await reportProvider.deleteReport(serverId);
  }

  Future<void> deleteReports(String workServerId) async {
    return await reportProvider.deleteReports(workServerId);
  }
}
