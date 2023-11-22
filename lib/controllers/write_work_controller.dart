import 'package:cow_cold/common/prefs_utils.dart';
import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/user_provider.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repositories/user_repository.dart';

class WriteWorkController extends GetxController {
  final WorkRepository workRepository =
      WorkRepository(workProvider: WorkProvider());
  final UserRepository userRepository =
      UserRepository(userProvider: UserProvider());

  final title = TextEditingController();
  final description = TextEditingController();
  RxString category = '웹소설'.obs;
  RxList<String> categoryList = <String>[].obs;
  List<String> customCategory =
      PrefsUtils.getStringList(PrefsUtils.customCategory);

  @override
  void onInit() {
    super.onInit();
    categoryList.value = ['웹소설', '소설', '시나리오', ...customCategory];
  }

  void selectCategory(String text) {
    category.value = text;
  }

  Future<void> createWork() async {
    if (title.text.isEmpty) {
      Get.snackbar('작품명 입력', '작품명을 적어주세요!');
      return;
    }

    try {
      Work newWork = await workRepository.createWork(
          title.text, category.value, description.text);
      Get.find<WorkController>().addWork(newWork);
      Get.back();
    } catch (error) {
      Get.snackbar('작품 추가 실패', '작품 업로드 중 문제가 발생하였습니다.');
    }
  }

  Future<void> addCategory(String category) async {
    if (category.isEmpty) {
      Get.snackbar('카테고리 입력', '카테고리가 비어있습니다.');
      return;
    }
    if (customCategory.contains(category)) {
      Get.snackbar('중복 카테고리', '이미 존재하는 카테고리 입니다.');
      return;
    }

    try {
      await userRepository.addCategory(category);

      final newCategory = [...categoryList, category];
      PrefsUtils.setStringList(
          PrefsUtils.customCategory, [...customCategory, category]);
      categoryList.assignAll(newCategory);
      customCategory = newCategory;

      if (Get.isBottomSheetOpen ?? false) {
        Get.back();
      }
    } catch (error) {
      Get.snackbar('카테고리 추가 실패', '카테고리 업로드 중 문제가 발생하였습니다.');
    }
  }
}
