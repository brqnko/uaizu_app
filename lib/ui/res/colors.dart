import 'package:flutter/material.dart';

class AppThemeColor {
  static final dark = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFF323539),
      primary: Color(0xFF1c1f23),
      onPrimary: Color(0xFF99aab5),
      onPrimaryFixed: Color(0xFFC0C0C0),
      onSurface: Color(0xFFC0C0C0),
      onSurfaceVariant: Color(0xFFC0C0C0),
      secondary: Color(0xFF23272a),
      onPrimaryContainer: Color(0xFF23272a),
    ),
  );

  static final light = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFF0F0F0),
      primary: Color(0xFF326458),
      onPrimary: Color(0xFF41BFB3),
      onPrimaryFixed: Color(0xFF9BF2EA),
      onSurface: Color(0xFF050505),
      onSurfaceVariant: Color(0xFF707070),
      secondary: Colors.white,
      onPrimaryContainer: Color(0xFF124438),
    ),
  );
}
