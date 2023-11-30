import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class WritePopMenuItem extends StatelessWidget {
  const WritePopMenuItem(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.isLast});

  final String text;
  final Color backgroundColor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 60 : 20),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
                color: DesignSystem.colors.black.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: Text(
        text,
        style: DesignSystem.typography.title3(TextStyle(
          color: DesignSystem.colors.white,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}
