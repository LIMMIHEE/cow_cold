import 'package:cow_cold/common/prefs_utils.dart';
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
        value: PrefsUtils.getBool(PrefsUtils.darkMode),
        onChanged: (isDark) {
          setState(() {
            Get.changeTheme(AppThemeData.appThemeData(isDark));
            PrefsUtils.setBool(PrefsUtils.darkMode, isDark);
          });
        },
      ),
    );
  }
}
