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

  final contentFocus = FocusNode();
  final content = TextEditingController();
  final dropDownList = <DropDownValueModel>[].obs;

  Report? initialReport;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  onClose() {
    contentFocus.dispose();
    super.onClose();
  }

  void initData() {
    final arguments = Get.arguments;
    String initialWorkId = '';
    if (arguments != null) {
      initialWorkId = arguments['initialWorkId'] as String;
      if (arguments['initialReport'] != null) {
        initialReport = arguments['initialReport'] as Report;
        content.text = initialReport!.content;
      }
    }

    dropDownList.assignAll(
      Get.find<WorkController>().workList.map((work) {
        final dropDown = DropDownValueModel(name: work.title, value: work);
        if (work.serverId == initialWorkId) {
          workName.setDropDown(dropDown);
        }
        return dropDown;
      }),
    );

    contentFocus.addListener(update);
  }

  Future<void> createOrUpdateReport() async {
    if (workName.dropDownValue == null) {
      showSnackBar('작품 선택', '작품을 선택해주세요!');
      return;
    }

    if (content.text.isEmpty) {
      showSnackBar('감상 작성', '감상란이 비어있습니다!');
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

        await updateExistingReport(report);
      } else {
        await createNewReport(report);
      }
    } catch (error) {
      showSnackBar('작업 실패', '업로드 중 문제가 발생하였습니다.');
    }
  }

  Future<void> updateExistingReport(Report report) async {
    await reportRepository.updateReport(report);
    await Get.find<ReportController>().updateReport(report);

    Get.back();
    showSnackBar('수정 완료', '성공적으로 감상을 수정했습니다.');
  }

  Future<void> createNewReport(Report report) async {
    final createdReport = await reportRepository.createReport(report);
    Get.find<ReportController>().addReport(createdReport);

    Get.back();
    showSnackBar('감상 추가 완료', '성공적으로 감상을 추가했습니다.');
  }

  void showSnackBar(String title, String message) {
    Future.delayed(const Duration(milliseconds: 50), () {
      Get.snackbar(title, message);
    });
  }

  void inputTextFocusField(String text) {
    content.text = text;
    update();
  }
}
