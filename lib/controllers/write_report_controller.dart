import 'package:cow_cold/controllers/home_main_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReportController extends GetxController {
  final SingleValueDropDownController workName =
      SingleValueDropDownController();
  final description = TextEditingController();
  List<DropDownValueModel> dropDownList = <DropDownValueModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    final List<DropDownValueModel> dropDownList = [];
    Get.find<HomeMainController>().workList.forEach((work) {
      dropDownList.add(DropDownValueModel(name: work.title, value: work));
    });
    this.dropDownList.addAll(dropDownList);
  }
}
