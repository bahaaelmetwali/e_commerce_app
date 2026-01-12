import 'package:e_commerce_app/app/core/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // ========= LIGHT THEME =========
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: TextStyles.fontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
       elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryText),
      titleTextStyle: TextStyles.medium17.copyWith(
        color: AppColors.primaryText,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyles.bold30,
      displayMedium: TextStyles.bold28,
      displaySmall: TextStyles.bold24,
      headlineMedium: TextStyles.semiBold22,
      headlineSmall: TextStyles.semiBold20,
      titleLarge: TextStyles.medium18,
      titleMedium: TextStyles.medium17.copyWith(color: AppColors.cardColor),
      titleSmall: TextStyles.regular14,
      bodyLarge: TextStyles.regular18,
      bodyMedium: TextStyles.regular16,
      bodySmall: TextStyles.regular14,
      labelLarge: TextStyles.medium14,
      labelSmall: TextStyles.medium12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyles.medium17,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyles.medium17.copyWith(color: AppColors.cardColor),
        backgroundColor: AppColors.primaryColor,
        side: BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.secondaryText),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryText),
      ),
      labelStyle: TextStyles.regular14.copyWith(color: AppColors.primaryText),
    ),
  );
}
