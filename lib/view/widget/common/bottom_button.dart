import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap,
      this.paddingVisible = true});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function() onTap;
  final bool paddingVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingVisible
          ? const EdgeInsets.symmetric(horizontal: 32, vertical: 8)
          : EdgeInsets.zero,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(0, 60),
            elevation: 0,
          ),
          onPressed: () => onTap(),
          child: Text(
            text,
            style: DesignSystem.typography.title1(
                TextStyle(fontWeight: FontWeight.w600, color: textColor)),
          )),
    );
  }
}
