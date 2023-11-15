import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/common/bottom_button.dart';
import 'package:cow_cold/view/widget/write/description_text_field.dart';
import 'package:flutter/material.dart';

class TextFieldBottomSheet extends StatelessWidget {
  const TextFieldBottomSheet(
      {super.key,
      required this.title,
      required this.hintText,
      required this.buttonText,
      required this.onTap});

  final String title;
  final String hintText;
  final String buttonText;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SizedBox(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 32),
            child: Text(
              title,
              style: DesignSystem.typography.heading3(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            constraints: const BoxConstraints(maxHeight: 60),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: DesignSystem.colors.appPrimary100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: DesignSystem.colors.black.withOpacity(0.3))),
            child: DescriptionTextField(
              hintText: hintText,
              maxLength: 10,
              controller: controller,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: BottomButton(
                text: buttonText,
                backgroundColor: DesignSystem.colors.appSecondary,
                textColor: DesignSystem.colors.white,
                onTap: () => onTap(controller.text)),
          )
        ],
      ),
    );
  }
}
