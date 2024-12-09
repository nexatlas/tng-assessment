import 'package:flutter/material.dart';

class StatusTheme extends ThemeExtension<StatusTheme> {
  final Color? success;
  final Color? failed;
  final Color? processing;

  const StatusTheme({this.success, this.failed, this.processing});

  @override
  ThemeExtension<StatusTheme> copyWith({
    Color? success,
    Color? failed,
    Color? processing,
  }) {
    return StatusTheme(
        success: success ?? this.success,
        failed: failed ?? this.failed,
        processing: processing ?? this.processing);
  }

  @override
  ThemeExtension<StatusTheme> lerp(
      ThemeExtension<StatusTheme>? other, double t) {
    if (other is! StatusTheme) {
      return this;
    }
    return StatusTheme(
        success: Color.lerp(success, other.success, t),
        failed: Color.lerp(failed, other.failed, t),
        processing: Color.lerp(processing, other.processing, t));
  }
}
