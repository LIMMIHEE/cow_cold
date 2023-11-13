import 'dart:convert';

import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:get/get.dart';

class HomeMainController extends GetxController {
  final WorkRepository workRepository =
      WorkRepository(workProvider: WorkProvider());

  bool isGetWorkData = false;
  RxList<Work> workList = <Work>[].obs;

  @override
  void onReady() {
    super.onReady();
    workRepository.getWork().then((works) {
      final List<Work> getWorks = [];
      for (final work in works.docs) {
        getWorks.add(Work.fromJson(jsonDecode(jsonEncode(work.data()))));
      }

      isGetWorkData = true;
      workList.addAll(getWorks);
    }).onError((error, stackTrace) {
      Get.snackbar('불러오기 실패', '데이터를 불러오는 도중 문제가 발생하였습니다.');
    });
  }

  void addWork(Work newWork) {
    workList.add(newWork);
  }
}
