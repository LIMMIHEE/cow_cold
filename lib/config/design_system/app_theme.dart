import 'package:cow_cold/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData appThemeData = ThemeData(
    colorScheme: colorScheme,
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: colorScheme.primary,
  );

  static ColorScheme colorScheme = ColorScheme(
    primary: DesignSystem.colors.appPrimary,
    primaryContainer: DesignSystem.colors.appPrimary100,
    secondary: DesignSystem.colors.appSecondary,
    secondaryContainer: DesignSystem.colors.white,
    background: DesignSystem.colors.white,
    surface: DesignSystem.colors.white,
    onBackground: DesignSystem.colors.white,
    error: DesignSystem.colors.deleteRed,
    onError: DesignSystem.colors.black,
    onPrimary: DesignSystem.colors.black,
    onSecondary: DesignSystem.colors.black,
    onSurface: DesignSystem.colors.black,
    brightness: Brightness.light,
  );
}
