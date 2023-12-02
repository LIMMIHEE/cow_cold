import 'package:flutter/material.dart';

class CustomMaterialColor {
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFEDECEA),
    100: Color(0xFFD3CFCB),
    200: Color(0xFFB6B0A8),
    300: Color(0xFF989085),
    400: Color(0xFF82786B),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF64584A),
    700: Color(0xFF594E40),
    800: Color(0xFF4F4437),
    900: Color(0xFF3D3327),
  });
  static const int _primaryPrimaryValue = 0xFF6C6051;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFFC988),
    200: Color(_primaryAccentValue),
    400: Color(0xFFFF9C22),
    700: Color(0xFFFF9008),
  });
  static const int _primaryAccentValue = 0xFFFFB255;
}
