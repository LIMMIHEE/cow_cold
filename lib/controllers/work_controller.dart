import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/work/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/user_repository.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:get/get.dart';

class WorkController extends GetxController {
  final WorkRepository workRepository =
      WorkRepository(workProvider: WorkProvider());
  final userRepository = UserRepository.userRepository;

  bool isGetWorkData = false;
  RxList<Work> workList = <Work>[].obs;

  @override
  void onReady() async {
    super.onReady();

    try {
      final QuerySnapshot works = await workRepository.getWorks();
      final QuerySnapshot? inviteWorks = await workRepository.getInviteWork();
      final getWorks = [...works.docs, ...(inviteWorks?.docs ?? [])]
          .map(
            (work) => Work.fromJson(jsonDecode(jsonEncode(work.data()))),
          )
          .toList();

      isGetWorkData = true;
      workList
        ..sort((b, a) => a.updateDate.compareTo(b.updateDate))
        ..addAll(getWorks);
      workList.removeWhere(
          (a) => a != getWorks.firstWhere((b) => b.serverId == a.serverId));
    } catch (error) {
      Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
    }
  }

  void addWork(Work newWork) {
    workList.add(newWork);
  }

  void updateWork(Work work) {
    workList[workList
        .indexWhere((element) => element.serverId == work.serverId)] = work;
  }

  void removeWork(Work deleteWork) async {
    try {
      await workRepository.deleteWork(
          deleteWork.serverId, deleteWork.inviteCode);
      workList.remove(deleteWork);
      Get.find<ReportController>().deleteReports(deleteWork.serverId);
      Get.back();
    } catch (error) {
      Get.snackbar('삭제 실패', '삭제 중 문제가 발생하였습니다.');
    }
  }

  Future<void> addInvitedWork(String inviteCode) async {
    final QuerySnapshot getWork =
        await workRepository.getWorkInviteCode(inviteCode);

    if (getWork.docs.isNotEmpty) {
      final convertWork =
          Work.fromJson(jsonDecode(jsonEncode(getWork.docs.first.data())));
      addWork(convertWork);
    }
  }

  void submitInviteCode(String inviteCode) async {
    try {
      await workRepository.submitInviteCode(inviteCode);
      await userRepository.addInviteWork(inviteCode);
      await addInvitedWork(inviteCode);
      Get.snackbar('추가 완료', '성공적으로 추가되었습니다!');
    } catch (error) {
      Get.snackbar('작품 추가 실패', '추가 중 문제가 발생하였습니다.');
    }
  }
}
