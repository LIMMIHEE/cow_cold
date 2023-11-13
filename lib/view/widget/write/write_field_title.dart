import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class WriteFieldTitle extends StatelessWidget {
  const WriteFieldTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 12),
      child: Text(
        title,
        style: DesignSystem.typography.body2(),
      ),
    );
  }
}
