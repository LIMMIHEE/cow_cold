import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLength,
    this.focusNode,
  });

  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        counterText: '',
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintStyle: DesignSystem.typography.body2(TextStyle(
          color: DesignSystem.colors.gray700,
          fontWeight: FontWeight.w400,
        )),
      ),
    );
  }
}
