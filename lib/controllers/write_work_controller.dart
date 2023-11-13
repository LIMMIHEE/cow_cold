import 'package:cow_cold/controllers/home_main_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteWorkController extends GetxController {
  final WorkRepository workRepository =
      WorkRepository(workProvider: WorkProvider());

  final title = TextEditingController();
  final description = TextEditingController();
  RxString category = '웹소설'.obs;

  void selectCategory(String text) {
    category.value = text;
    update();
  }

  Future<void> createWork() async {
    if (title.text.isEmpty) {
      Get.snackbar('작품명 입력', '작품명을 적어주세요!');
      return;
    }

    workRepository
        .createWork(title.text, category.value, description.text)
        .then((Work newWork) {
      Get.find<HomeMainController>().addWork(newWork);
      Get.back();
    }).onError((error, stackTrace) {
      Get.snackbar('작품 추가 실패', '작품 업로드 중 문제가 발생하였습니다.');
    });
  }
}
