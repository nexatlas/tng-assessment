import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? stokeColor;
  final Color? onboardBgColor;
  final Color? recipientGreenBg;
  final Color? eligibleProductBg;
  final Color? uploadBg;
  final Color? repaymentGreen;
  final Color? fillFadedGray;

  const AppColors({
    this.stokeColor,
    this.eligibleProductBg,
    this.recipientGreenBg,
    this.uploadBg,
    this.repaymentGreen,
    this.fillFadedGray,
    this.onboardBgColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? stokeColor,
  }) {
    return AppColors(
      stokeColor: stokeColor ?? this.stokeColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      stokeColor: Color.lerp(stokeColor, other.stokeColor, t),
    );
  }
}
