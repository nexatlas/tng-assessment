import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts.dart';

class AppTextStyle {
  static TextStyle get outFitRegularWeight400 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitRegularWeight500 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitBoldWeight600 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.outfitBold,
      );

  static TextStyle get outFitRegularWeight600 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitSmallWeight500 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitSmallWeight400 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitMediumWeight400 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitMediumWeight500 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitExtraSmallWeight500 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitExtraSmallWeight400 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.outfitRegular,
      );

  static TextStyle get outFitLargeWeight500 => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.outfitBold,
  );
}
