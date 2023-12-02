import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class WorkDetailVerticalDivider extends StatelessWidget {
  const WorkDetailVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: 6,
      thickness: 6,
      color: DesignSystem.colors.gray300,
    );
  }
}
