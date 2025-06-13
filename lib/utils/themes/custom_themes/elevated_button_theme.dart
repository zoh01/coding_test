import 'package:delivery_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ZohElevatedButtonTheme {
  ZohElevatedButtonTheme._();

  ///Light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: ZohColors.bgColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: ZohColors.bgColor),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );

  ///Dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: ZohColors.bgColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: ZohColors.bgColor),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    ),
  );
}