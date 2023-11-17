import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.controller, required this.onSubmitted});

  final TextEditingController controller;
  final Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (_) => onSubmitted(),
      style: DesignSystem.typography.body(TextStyle(
          color: DesignSystem.colors.white, fontWeight: FontWeight.w400)),
      decoration: InputDecoration(
        isDense: true,
        hintText: '검색어를 입력해주세요',
        hintStyle: DesignSystem.typography.body(TextStyle(
            color: DesignSystem.colors.gray700, fontWeight: FontWeight.w400)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: DesignSystem.colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: DesignSystem.colors.white),
        ),
        suffixIcon: IconButton(
          onPressed: controller.clear,
          icon: Icon(Icons.clear, color: DesignSystem.colors.white),
        ),
      ),
    );
  }
}
