import 'package:cow_cold/controllers/home_main_controller.dart';
import 'package:cow_cold/controllers/report_history_controller.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/providers/work_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
import 'package:cow_cold/data/repositories/work_repository.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReportController extends GetxController {
  final ReportRepository reportRepository =
      ReportRepository(reportProvider: ReportProvider());
  final SingleValueDropDownController workName =
      SingleValueDropDownController();
  final content = TextEditingController();
  List<DropDownValueModel> dropDownList = <DropDownValueModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final initialWork = Get.arguments as Work?;
    final List<DropDownValueModel> dropDownList = [];
    Get.find<HomeMainController>().workList.forEach((work) {
      final dropDown = DropDownValueModel(name: work.title, value: work);
      dropDownList.add(dropDown);
      if (work == initialWork) {
        workName.setDropDown(dropDown);
      }
    });
    this.dropDownList.addAll(dropDownList);
  }

  void createReport() {
    if (workName.dropDownValue == null) {
      Get.snackbar('작품명 선택', '작품명을 선택해주세요!');
      return;
    }

    if (content.text.isEmpty) {
      Get.snackbar('감상 작성', '감상란이 비어있습니다!');
      return;
    }

    final selectWork = workName.dropDownValue!.value as Work;
    reportRepository
        .createReport(selectWork.serverId, selectWork.title, content.text)
        .then((report) {
      Get.find<ReportHistoryController>().addReport(report);
      Get.back();
      Future.delayed(const Duration(milliseconds: 50), () {
        Get.snackbar('감상 추가 완료', '성공적으로 감상을 추가했습니다.');
      });
    }).onError((error, stackTrace) {
      Get.snackbar('감상 추가 실패', '업로드 중 문제가 발생하였습니다.');
    });
  }
}
