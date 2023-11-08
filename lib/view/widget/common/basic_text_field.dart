import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.minLength,
    this.autoFocus = false,
    this.isPassword = false,
  });

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final int? maxLength;
  final int? minLength;
  final bool autoFocus;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autoFocus,
      obscureText: isPassword,
      maxLength: maxLength,
      keyboardType: inputType,
      onChanged: (text) {
        if (onChanged != null) {
          onChanged!(text);
        }
      },
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
