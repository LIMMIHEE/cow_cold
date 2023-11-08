import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField({
    super.key,
    required this.title,
    required this.textField,
  });

  final String title;
  final Widget textField;

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
          textField
        ],
      ),
    );
  }
}
