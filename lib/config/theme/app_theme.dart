import 'package:flutter/material.dart';
import 'package:tmdb/config/theme/colors/app_colors.dart';
import 'package:tmdb/config/theme/text_theme/app_text_theme.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: Colors.blue,
    textTheme: AppTextTheme.light,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
  );
  static ThemeData dark = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: Colors.blue,
    textTheme: AppTextTheme.dark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
  );
}
