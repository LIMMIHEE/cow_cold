import 'dart:ui';

import 'package:get/get.dart';

abstract class _LightScheme {
  static const Color appPrimary = Color(0xFFBC9F7C);
  static const Color appSecondary = Color(0xFF6C6051);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xFFE1E1E1);
  static const Color gray500 = Color(0xFF8B8B8B);
  static const Color gray700 = Color(0xff9D9D9D);
  static const Color gray900 = Color(0xFFF3F3F3);
  static const Color deleteRed = Color(0xFFFA3C3C);
  static const Color shadow = Color(0x0C000000);
  static const Color textPrimary = Color(0xFF121212);
  static const Color divider = Color(0xFFC9C9C9);
  static const Color background = Color(0xFFFFFFFF);
}

abstract class _DarkScheme {
  static const Color appPrimary = Color(0xFF6C6051);
  static const Color appSecondary = Color(0xFFBC9F7C);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xff9D9D9D);
  static const Color gray500 = Color(0xFF8B8B8B);
  static const Color gray700 = Color(0xff9D9D9D);
  static const Color gray900 = Color(0xFFE1E1E1);
  static const Color deleteRed = Color(0xFFFA3C3C);
  static const Color shadow = Color(0x0cffffff);
  static const Color divider = Color(0xFFC9C9C9);
  static const Color background = Color(0xFF18130E);
  static const Color textPrimary = Color(0xFF121212);
}

class Colors {
  Colors._();

  static final Colors _instance = Colors._();

  static Colors get instance => _instance;

  Color get mainColor => const Color(0xFFBC9F7C);

  Color get appPrimary =>
      Get.isDarkMode ? _DarkScheme.appPrimary : _LightScheme.appPrimary;

  Color get appSecondary =>
      Get.isDarkMode ? _DarkScheme.appSecondary : _LightScheme.appSecondary;

  Color get black => Get.isDarkMode ? _DarkScheme.black : _LightScheme.black;

  Color get white => Get.isDarkMode ? _DarkScheme.white : _LightScheme.white;

  Color get gray700 =>
      Get.isDarkMode ? _DarkScheme.gray700 : _LightScheme.gray700;

  Color get gray100 =>
      Get.isDarkMode ? _DarkScheme.gray100 : _LightScheme.gray100;

  Color get deleteRed =>
      Get.isDarkMode ? _DarkScheme.deleteRed : _LightScheme.deleteRed;

  // text
  Color get textPrimary =>
      Get.isDarkMode ? _DarkScheme.textPrimary : _LightScheme.textPrimary;

  Color get textSecondary =>
      Get.isDarkMode ? _DarkScheme.gray500 : _LightScheme.gray500;

  // background
  Color get backgroundDisabled =>
      Get.isDarkMode ? _DarkScheme.gray900 : _LightScheme.gray900;

  Color get background =>
      Get.isDarkMode ? _DarkScheme.background : _LightScheme.background;

  //divider
  Color get divider =>
      Get.isDarkMode ? _DarkScheme.divider : _LightScheme.divider;

  //shadow
  Color get shadow => Get.isDarkMode ? _DarkScheme.shadow : _LightScheme.shadow;
}
