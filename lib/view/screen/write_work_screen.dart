import 'package:cow_cold/common/utils.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/write_work_controller.dart';
import 'package:cow_cold/view/widget/common/basic_app_bar.dart';
import 'package:cow_cold/view/widget/common/basic_text_field.dart';
import 'package:cow_cold/view/widget/common/scaffold_body.dart';
import 'package:cow_cold/view/widget/common/speech_text_button.dart';
import 'package:cow_cold/view/widget/common/text_field_bottom_sheet.dart';
import 'package:cow_cold/view/widget/common/chip_item.dart';
import 'package:cow_cold/view/widget/write/description_text_field.dart';
import 'package:cow_cold/view/widget/write/write_field_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteWorkScreen extends StatelessWidget {
  const WriteWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<WriteWorkController>(
        init: WriteWorkController(),
        builder: (controller) {
          return ScaffoldBody(
              appBar: basicAppBar('작품 작성', actions: [
                TextButton(
                    onPressed: () {
                      controller.createOrUpdateWork();
                    },
                    child: Text(
                      '완료',
                      style: DesignSystem.typography.body(),
                    ))
              ], onTap: () {
                if (controller.title.text.isNotEmpty ||
                    controller.description.text.isNotEmpty) {
                  Utils.utils.defaultDialog(
                    '나가기',
                    '화면을 나가시겠습니까?\n작성중인 내용은 사라집니다.',
                  );
                } else {
                  Get.back();
                }
              }),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BasicTextField(
                            hintText: '작품명',
                            controller: controller.title,
                            focusNode: controller.titleFocus,
                          ),
                          const WriteFieldTitle(
                            title: '카테고리',
                          ),
                          Wrap(
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: [
                              for (final category in controller.categoryList)
                                ChipItem(
                                  text: category,
                                  selectText: controller.category.value,
                                  onTap: (text) {
                                    controller.selectCategory(text);
                                  },
                                ),
                              ChipItem(
                                selectText: controller.category.value,
                                onTap: (_) {
                                  Get.bottomSheet(
                                      TextFieldBottomSheet(
                                        title: '카테고리',
                                        hintText: '카테고리를 입력해주세요.',
                                        buttonText: '추가',
                                        onTap: (text) {
                                          controller.addCategory(text);
                                        },
                                      ),
                                      backgroundColor:
                                          DesignSystem.colors.white);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: DesignSystem.colors.textPrimary,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          const WriteFieldTitle(
                            title: '부가정보',
                          ),
                          Container(
                            constraints: const BoxConstraints(minHeight: 180),
                            padding: const EdgeInsets.all(18),
                            decoration: ShapeDecoration(
                              color: DesignSystem.colors.appPrimary100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: DescriptionTextField(
                                controller: controller.description,
                                hintText: '감상 플랫폼 혹은 작가등 기타 정보를 남겨주세요.',
                                focusNode: controller.descriptionFocus,
                                maxLength: 1200),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: controller.speechTextButtonVisible.value,
                      child: SpeechTextButton(
                        speechComplete: controller.inputTextFocusField,
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
