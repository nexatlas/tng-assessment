import 'package:chefwizz/core/styles/status_theme.dart';
import 'package:chefwizz/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension ThemeExtensionX on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get primaryTextTheme => themeData.primaryTextTheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get overline => textTheme.labelSmall;

  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get hintStyle => inputDecorationTheme.hintStyle;

  Color get primaryColor => themeData.primaryColor;
  Color? get titleLargeColor => titleLarge?.color;
  Color? get titleMediumColor => titleMedium?.color;
  Color? get displayLargeColor => displayLarge?.color;
  Color? get bodyMediumColor => bodyMedium?.color;
  Color? get bodySmallColor => bodySmall?.color;

  Color? get bodyLargeColor => bodyLarge?.color;

  Color get errorColor => themeData.colorScheme.error;
  Color? get successColor => customTheme<StatusTheme>().success;

  Color get scaffoldBackgroundColor => themeData.scaffoldBackgroundColor;

  InputDecorationTheme get inputDecorationTheme => themeData.inputDecorationTheme;
  Color? get inputDecorationBorderColor => inputDecorationTheme.border?.borderSide.color;
  Color? get inputFieldFillColor => inputDecorationTheme.fillColor;
  Color? get fillColor => inputFieldFillColor;

  // ===================================================================
  TextStyle? get bodyText1 => bodyLarge;
  TextStyle? get bodyText2 => bodyMedium;
  TextStyle? get caption => textTheme.bodySmall;
  TextStyle? get headline5 => headlineSmall;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get button => textTheme.labelLarge;

  TextStyle? get subtitle1 => titleMedium;

  TextStyle? get subtitle2 => titleSmall;

  TextStyle? get headline4 => headlineMedium;

  TextStyle? get headline6 => titleLarge;

  TextStyle? get headline1 => displayLarge;

  TextStyle? get popUpButtonTextStyle => themeData.popupMenuTheme.textStyle;

  Color? get subtitle1Color => subtitle1?.color;
}
