import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/providers/report_provider.dart';

class ReportRepository {
  final ReportProvider reportProvider;

  ReportRepository({required this.reportProvider});

  Future<QuerySnapshot> getUserReports() async {
    return await reportProvider.getUserReports();
  }

  Future<QuerySnapshot> getInviteWorkReports(String workServerId) async {
    return await reportProvider.getInviteWorkReports(workServerId);
  }

  Future<Report> createReport(Report report) async {
    return await reportProvider.createReport(report);
  }

  Future<void> updateReport(Report report) async {
    return await reportProvider.updateReport(report);
  }

  Future<void> deleteReport(String serverId) async {
    return await reportProvider.deleteReport(serverId);
  }

  Future<void> deleteReports(String workServerId) async {
    return await reportProvider.deleteReports(workServerId);
  }
}
