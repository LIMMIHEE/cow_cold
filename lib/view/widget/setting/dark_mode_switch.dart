import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/config/design_system/app_theme.dart';
import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.85,
      child: CupertinoSwitch(
        activeColor: DesignSystem.colors.black,
        value: Prefs.getBool(Prefs.darkMode),
        onChanged: (isDark) {
          setState(() {
            Get.changeTheme(AppThemeData.appThemeData(isDark));
            Prefs.setBool(Prefs.darkMode, isDark);
          });
        },
      ),
    );
  }
}
