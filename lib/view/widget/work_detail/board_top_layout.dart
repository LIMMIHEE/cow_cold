import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/work_detail/work_detail_vertical_divider.dart';
import 'package:flutter/material.dart';

class BoardTopLayout extends StatelessWidget {
  const BoardTopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 19),
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
              color: DesignSystem.colors.appPrimary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: DesignSystem.colors.appSecondary),
        ),
        const SizedBox(
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WorkDetailVerticalDivider(),
              WorkDetailVerticalDivider(),
              WorkDetailVerticalDivider(),
            ],
          ),
        ),
      ],
    );
  }
}
