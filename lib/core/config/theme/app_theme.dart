import 'package:chat_app_demo/core/config/theme/color.dart';
import 'package:chat_app_demo/core/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ),
    textTheme: kTextTheme(kTextColor),
    scaffoldBackgroundColor: Colors.grey.shade100,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.black,
      primary: Colors.black54,
      secondary: Colors.black87,
      tertiary: Colors.black45,
      inversePrimary: Colors.grey.shade900,
    ),
    textTheme: kTextTheme(Colors.white),
    scaffoldBackgroundColor: Colors.black,
  );
}
