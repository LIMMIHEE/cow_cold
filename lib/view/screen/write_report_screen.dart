import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/write_report_controller.dart';
import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/write/description_text_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WriteReportScreen extends StatelessWidget {
  const WriteReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WriteReportController>(
        init: WriteReportController(),
        builder: (controller) {
          return ScaffoldBody(
              appBar: basicAppBar('감상추가', actions: [
                TextButton(
                    onPressed: () {
                      controller.createReport();
                    },
                    child: Text(
                      '완료',
                      style: DesignSystem.typography.body(),
                    ))
              ], onTap: () {
                if (controller.content.text.isNotEmpty) {
                  Get.defaultDialog(
                      title: '나가기',
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Text('화면을 나가시겠습니까?\n작성중인 내용은 사라집니다.'),
                      ),
                      textConfirm: '취소',
                      confirmTextColor: Colors.white,
                      onConfirm: Get.back,
                      textCancel: '확인',
                      onCancel: Get.back,
                      titlePadding: const EdgeInsets.symmetric(vertical: 12),
                      cancelTextColor: DesignSystem.colors.appPrimary,
                      buttonColor: DesignSystem.colors.appPrimary);
                } else {
                  Get.back();
                }
              }),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropDownTextField(
                      controller: controller.workName,
                      textFieldDecoration:
                          const InputDecoration(labelText: '작품 선택'),
                      searchDecoration:
                          const InputDecoration(hintText: "검색할 작품명을 입력해 주세요"),
                      clearOption: true,
                      searchKeyboardType: TextInputType.text,
                      enableSearch: true,
                      dropDownList: controller.dropDownList,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        DateFormat.yMMMd('ko').format(DateTime.now()),
                        style: DesignSystem.typography.body(),
                      ),
                    ),
                    DescriptionTextField(
                        controller: controller.content,
                        hintText: '감상을 남겨주세요.',
                        maxLength: 1200),
                  ],
                ),
              ));
        });
  }
}
