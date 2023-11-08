import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    this.controller,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.autoFocus = false,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final int? maxLength;
  final bool autoFocus;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      obscureText: isPassword,
      maxLength: maxLength,
      keyboardType: inputType,
      textAlign: isPassword ? TextAlign.center : TextAlign.start,
      style: DesignSystem.typography.heading3(),
      obscuringCharacter: '●',
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        hintText: hintText,
        hintStyle: DesignSystem.typography.heading3(TextStyle(
            color: DesignSystem.colors.gray100, fontWeight: FontWeight.w600)),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: DesignSystem.colors.appPrimary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: DesignSystem.colors.appPrimary),
        ),
      ),
    );
  }
}
