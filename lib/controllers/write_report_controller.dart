import 'package:cow_cold/controllers/work_controller.dart';
import 'package:cow_cold/controllers/report_controller.dart';
import 'package:cow_cold/data/models/report.dart';
import 'package:cow_cold/data/models/work.dart';
import 'package:cow_cold/data/providers/report_provider.dart';
import 'package:cow_cold/data/repositories/report_repository.dart';
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

  Report? initialReport;

  @override
  void onInit() {
    super.onInit();
    initializeDropDownList();
  }

  void initializeDropDownList() {
    String initialWorkId = '';
    if (Get.arguments != null) {
      initialWorkId = Get.arguments['initialWorkId'] as String;
      if (Get.arguments['initialReport'] != null) {
        initialReport = Get.arguments['initialReport'] as Report;
        content.text = initialReport!.content;
      }
    }

    dropDownList = Get.find<WorkController>().workList.map((work) {
      final dropDown = DropDownValueModel(name: work.title, value: work);
      if (work.serverId == initialWorkId) {
        workName.setDropDown(dropDown);
      }
      return dropDown;
    }).toList();
  }

  Future<void> createOrUpdateReport() async {
    if (workName.dropDownValue == null) {
      Get.snackbar('작품명 선택', '작품명을 선택해주세요!');
      return;
    }

    if (content.text.isEmpty) {
      Get.snackbar('감상 작성', '감상란이 비어있습니다!');
      return;
    }

    final selectWork = workName.dropDownValue!.value as Work;
    final report = Report(
      workServerId: selectWork.serverId,
      title: selectWork.title,
      content: content.text,
      updateDate: DateTime.now().toString(),
    );

    try {
      if (initialReport != null &&
          selectWork.serverId == initialReport!.workServerId) {
        report.serverId = initialReport!.serverId;
        report.createUserId = initialReport!.createUserId;
        report.createUserName = initialReport!.createUserName;

        await reportRepository.updateReport(report);
        await Get.find<ReportController>().updateReport(report);

        Get.back();
        showSnackBar('수정 완료', '성공적으로 감상을 수정했습니다.');
      } else {
        final createdReport = await reportRepository.createReport(report);
        Get.find<ReportController>().addReport(createdReport);

        Get.back();
        showSnackBar('감상 추가 완료', '성공적으로 감상을 추가했습니다.');
      }
    } catch (error) {
      showSnackBar('작업 실패', '업로드 중 문제가 발생하였습니다.');
    }
  }

  void showSnackBar(String title, String message) {
    Future.delayed(const Duration(milliseconds: 50), () {
      Get.snackbar(title, message);
    });
  }
}
