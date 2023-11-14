import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/controllers/write_work_controller.dart';
import 'package:cow_cold/view/widget/common/text_field_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryRadio extends StatelessWidget {
  const CategoryRadio(
      {super.key, this.child, this.text = '', required this.controller});

  final String text;
  final WriteWorkController controller;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isSelectCategory = controller.category.value == text;
    return GestureDetector(
      onTap: () {
        if (text.isNotEmpty) {
          controller.selectCategory(text);
        } else if (child != null) {
          Get.bottomSheet(
              TextFieldBottomSheet(
                title: '카테고리',
                hintText: '카테고리를 입력해주세요.',
                buttonText: '추가',
                onTap: () {},
              ),
              backgroundColor: DesignSystem.colors.white);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: ShapeDecoration(
          color: isSelectCategory
              ? DesignSystem.colors.appPrimary
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: child ??
            Text(
              text,
              style: DesignSystem.typography.title3(TextStyle(
                  color: isSelectCategory
                      ? DesignSystem.colors.white
                      : DesignSystem.colors.textPrimary,
                  fontWeight: FontWeight.w500)),
            ),
      ),
    );
  }
}
