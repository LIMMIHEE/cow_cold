import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final search = TextEditingController();
  final searchFocus = FocusNode();
  final filterList = ['작품명', '작품설명', '카테고리'];
  late final List<Work> workList;

  RxString filter = '작품명'.obs;
  RxList<Work> resultList = <Work>[].obs;
  bool isSearchStart = false;

  @override
  void onInit() {
    super.onInit();
    workList = Get.find<WorkController>().workList;
    searchFocus.addListener(filter.refresh);
  }

  @override
  onClose() {
    searchFocus.dispose();
    super.onClose();
  }

  void selectFilter(String text) {
    filter.value = text;
  }

  void searchWork() {
    if (search.text.isEmpty) {
      return;
    }
    isSearchStart = true;
    resultList.value = workList.where((work) {
      switch (filter.value) {
        case '작품명':
          return work.title.contains(search.text);
        case '카테고리':
          return work.category.contains(search.text);
        case '작품설명':
          return work.description.contains(search.text);
        default:
          return false;
      }
    }).toList();
  }

  void inputTextFocusField(String text) {
    search.text = text;
    update();
  }
}
