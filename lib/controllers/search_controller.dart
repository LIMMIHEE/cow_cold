import 'package:cow_cold/controllers/home_main_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final search = TextEditingController();
  final filterList = ['작품명', '작품설명', '카테고리'];
  late final List<Work> workList;

  RxString filter = '작품명'.obs;
  RxList<Work> resultList = <Work>[].obs;
  bool isSearchStart = false;

  @override
  void onInit() {
    super.onInit();
    workList = Get.find<HomeMainController>().workList;
  }

  void selectFilter(String text) {
    filter.value = text;
  }

  void searchWork() {
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
}
