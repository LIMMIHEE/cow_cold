import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:cow_cold/view/widget/setting/setting_row.dart';
import 'package:flutter/material.dart';

class SettingRowButton extends StatelessWidget {
  const SettingRowButton({
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
        child: SettingRow(
          title: title,
          widget: Icon(
            iconData,
            size: 16,
          ),
        ));
  }
}
