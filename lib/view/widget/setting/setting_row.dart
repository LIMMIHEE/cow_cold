import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
      child: Row(children: [
        Expanded(
          child: Text(
            title,
            style: DesignSystem.typography.body2(),
          ),
        ),
        widget
      ]),
    );
  }
}
