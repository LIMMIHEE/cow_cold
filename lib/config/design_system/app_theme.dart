import 'package:cow_cold/config/design_system/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData appThemeData(bool isDarkMode) {
    final colorScheme = isDarkMode ? darkColorScheme : lightColorScheme;
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      focusColor: colorScheme.primary,
      primaryColor: colorScheme.primary,
      primaryColorDark: colorScheme.primary,
      primaryColorLight: colorScheme.primary,
    );
  }

  static ColorScheme darkColorScheme = const ColorScheme(
    primary: DarkScheme.appPrimary,
    primaryContainer: DarkScheme.appPrimary100,
    secondary: DarkScheme.appSecondary,
    secondaryContainer: DarkScheme.white,
    background: DarkScheme.background,
    surface: DarkScheme.white,
    onBackground: DarkScheme.background,
    error: DarkScheme.deleteRed,
    onError: DarkScheme.black,
    onPrimary: DarkScheme.textPrimary,
    onSecondary: DarkScheme.textPrimary,
    onSurface: DarkScheme.textPrimary,
    brightness: Brightness.dark,
  );

  static ColorScheme lightColorScheme = const ColorScheme(
    primary: LightScheme.appPrimary,
    primaryContainer: LightScheme.appPrimary100,
    secondary: LightScheme.appSecondary,
    secondaryContainer: LightScheme.white,
    background: LightScheme.background,
    surface: LightScheme.white,
    onBackground: LightScheme.background,
    error: LightScheme.deleteRed,
    onError: LightScheme.black,
    onPrimary: LightScheme.black,
    onSecondary: LightScheme.black,
    onSurface: LightScheme.black,
    brightness: Brightness.light,
  );
}
