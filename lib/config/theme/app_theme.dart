import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme()=> ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    colorSchemeSeed: const Color(0xff2862f5)
  );
}