import 'dart:convert';

import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:get/get.dart';

class WorkController extends GetxController {
  final WorkRepository workRepository =
      WorkRepository(workProvider: WorkProvider());

  bool isGetWorkData = false;
  RxList<Work> workList = <Work>[].obs;

  @override
  void onReady() async {
    super.onReady();

    try {
      final works = await workRepository.getWork();
      final getWorks = works.docs
          .map(
            (work) => Work.fromJson(jsonDecode(jsonEncode(work.data()))),
          )
          .toList();

      isGetWorkData = true;
      workList
        ..sort((b, a) => a.updateDate.compareTo(b.updateDate))
        ..addAll(getWorks);
    } catch (error) {
      Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
    }
  }

  void addWork(Work newWork) {
    workList.add(newWork);
  }

  void removeWork(Work deleteWork) async {
    try {
      await workRepository.deleteWork(deleteWork.serverId);
      workList.remove(deleteWork);
      Get.find<ReportController>().deleteReports(deleteWork.serverId);
      Get.back();
    } catch (error) {
      Get.snackbar('삭제 실패', '삭제 중 문제가 발생하였습니다.');
    }
  }
}
