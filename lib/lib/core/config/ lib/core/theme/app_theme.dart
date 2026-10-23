import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF7C4DFF);
  static const background = Color(0xFFF8F7FF);
  static const darkBg = Color(0xFF0F0F12);

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, background: background),
    scaffoldBackgroundColor: background,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.dark, background: darkBg),
    scaffoldBackgroundColor: darkBg,
  );
}
