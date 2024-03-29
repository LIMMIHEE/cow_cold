import 'dart:convert';
import 'package:cow_cold/controllers/user_controller.dart';
import 'package:cow_cold/data/models/reactions/reaction.dart';
import 'package:cow_cold/data/models/report/report.dart';
import 'package:cow_cold/data/models/work/work.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  late ReportRepository _reportRepository;
  late String userId;

  RxList<Report> myReports = <Report>[].obs;
  RxMap<String, List<Report>> inviteWorkReports = <String, List<Report>>{}.obs;
  final emojiKeyboardShowing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _reportRepository = ReportRepository(reportProvider: ReportProvider());
    userId = Get.find<UserController>().userId;
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
    final String userId = Get.find<UserController>().userId;

    return inviteWorkReports[workId]
        ?.where((report) => report.createUserId != userId)
        .toList();
  }

  void addReport(Report newReport) {
    myReports.add(newReport);
  }

  Future<void> updateMyReport(Report report) async {
    myReports[myReports
        .indexWhere((element) => element.serverId == report.serverId)] = report;
  }

  Future<void> updateInviteWorkReport(Report report) async {
    final reports = inviteWorkReports[report.workServerId];

    reports![reports
        .indexWhere((element) => element.serverId == report.serverId)] = report;
  }

  Future<void> deleteReport(Report report) async {
    await _reportRepository.deleteReport(report.serverId);
    myReports.remove(report);
  }

  Future<void> deleteReports(String workServerId) async {
    await _reportRepository.deleteReports(workServerId);
  }

  Future<void> selectEmoji(Report report, String emoji) async {
    final reactions = report.reactions ?? [];
    final findReaction =
        reactions.firstWhereOrNull((element) => element.emoji == emoji);
    if (findReaction != null && findReaction.reactionUsers.contains(userId)) {
      final List<String> userList = [...findReaction.reactionUsers];
      userList.removeWhere((id) => id == userId);

      if (userList.isEmpty) {
        reactions.remove(findReaction);
      } else {
        final newReaction = findReaction.copyWith(reactionUsers: userList);
        reactions[reactions.indexWhere((element) => element.emoji == emoji)] =
            newReaction;
      }
    } else {
      reactions.add(Reaction(emoji: emoji, reactionUsers: [userId]));
    }

    report = report.copyWith(reactions: reactions);
    await _reportRepository.updateReport(report);
    if (report.createUserId == userId) {
      updateMyReport(report);
    } else {
      updateInviteWorkReport(report);
    }
  }

  void setEmojiKeyboardShowing(bool showing) {
    emojiKeyboardShowing.value = showing;
  }

  void _showErrorSnackbar() {
    Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
  }
}
