import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LightScheme {
  static const Color appPrimary = Color(0xFFBC9F7C);
  static const Color appSecondary = Color(0xFF6C6051);
  static const Color appPrimary100 = Color(0x33BC9F7C);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xFFE1E1E1);
  static const Color gray300 = Color(0xFFC7C7C7);
  static const Color gray500 = Color(0xFF8B8B8B);
  static const Color gray700 = Color(0xff9D9D9D);
  static const Color gray900 = Color(0xFFF3F3F3);
  static const Color deleteRed = Color(0xFFFA3C3C);
  static const Color shadow = Color(0x0C000000);
  static const Color textPrimary = Color(0xFF121212);
  static const Color divider = Color(0xFFC9C9C9);
  static const Color background = Color(0xFFFFFFFF);
}

abstract class DarkScheme {
  static const Color appPrimary = Color(0xFF6C6051);
  static const Color appPrimary100 = Color(0x1ABC9F7C);
  static const Color appSecondary = Color(0xFFBC9F7C);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xff9D9D9D);
  static const Color gray300 = Color(0xFFC7C7C7);
  static const Color gray500 = Color(0xFF8B8B8B);
  static const Color gray700 = Color(0xff9D9D9D);
  static const Color gray900 = Color(0xFFE1E1E1);
  static const Color deleteRed = Color(0xFFFA3C3C);
  static const Color shadow = Color(0x0cffffff);
  static const Color divider = Color(0xFFC9C9C9);
  static const Color background = Color(0xFF262525);
  static const Color textPrimary = Color(0xFFFFFFFF);
}

class Colors {
  Colors._();

  static final Colors _instance = Colors._();

  static Colors get instance => _instance;

  Color get mainColor => const Color(0xFFBC9F7C);

  Color get appPrimary100 =>
      Get.isDarkMode ? DarkScheme.appPrimary100 : LightScheme.appPrimary100;

  Color get appPrimary =>
      Get.isDarkMode ? DarkScheme.appPrimary : LightScheme.appPrimary;

  Color get appSecondary =>
      Get.isDarkMode ? DarkScheme.appSecondary : LightScheme.appSecondary;

  Color get black => Get.isDarkMode ? DarkScheme.black : LightScheme.black;

  Color get white => Get.isDarkMode ? DarkScheme.white : LightScheme.white;

  Color get gray300 =>
      Get.isDarkMode ? DarkScheme.gray300 : LightScheme.gray300;

  Color get gray700 =>
      Get.isDarkMode ? DarkScheme.gray700 : LightScheme.gray700;

  Color get gray100 =>
      Get.isDarkMode ? DarkScheme.gray100 : LightScheme.gray100;

  Color get deleteRed =>
      Get.isDarkMode ? DarkScheme.deleteRed : LightScheme.deleteRed;

  // text
  Color get textPrimary =>
      Get.isDarkMode ? DarkScheme.textPrimary : LightScheme.textPrimary;

  Color get textSecondary =>
      Get.isDarkMode ? DarkScheme.gray500 : LightScheme.gray500;

  // background
  Color get backgroundDisabled =>
      Get.isDarkMode ? DarkScheme.gray900 : LightScheme.gray900;

  Color get background =>
      Get.isDarkMode ? DarkScheme.background : LightScheme.background;

  //divider
  Color get divider =>
      Get.isDarkMode ? DarkScheme.divider : LightScheme.divider;

  //shadow
  Color get shadow => Get.isDarkMode ? DarkScheme.shadow : LightScheme.shadow;
}
