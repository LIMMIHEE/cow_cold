import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/basic_text_field.dart';
import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller});

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: DesignSystem.typography.body2(TextStyle(
                fontWeight: FontWeight.w400,
                color: DesignSystem.colors.gray700)),
          ),
          BasicTextField(
            hintText: hintText,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
