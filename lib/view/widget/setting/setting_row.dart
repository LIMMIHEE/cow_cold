import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        child: Row(children: [
          Expanded(
            child: Text(
              title,
              style: DesignSystem.typography.body2(TextStyle(
                  fontWeight: FontWeight.w400,
                  color: DesignSystem.colors.textPrimary)),
            ),
          ),
          Icon(
            iconData,
            size: 16,
          ),
        ]),
      ),
    );
  }
}
