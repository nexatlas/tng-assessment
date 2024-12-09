import 'package:flutter/material.dart';

import 'colors.dart';
import 'textstyles.dart';

class LightTheme {
  static const primaryColor = AppColors.k500495;

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: primaryColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor),
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: AppColors.k171717,
          foregroundColor: AppColors.k171717,
          titleTextStyle: AppTextStyle.outFitRegularWeight500,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.maxFinite, 40),
            elevation: 0,
            textStyle: AppTextStyle.outFitRegularWeight400.copyWith(fontSize: 14),
            foregroundColor: AppColors.white,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
}
