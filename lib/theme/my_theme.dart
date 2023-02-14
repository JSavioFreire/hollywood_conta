import 'package:flutter/material.dart';
import 'package:hollywood_conta/theme/theme_colors.dart';

ThemeData myTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      iconColor: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.myBlue,
  ),
);
