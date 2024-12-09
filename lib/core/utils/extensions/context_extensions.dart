import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  T customTheme<T>() => Theme.of(this).extension<T>()!;

  EdgeInsetsGeometry get bottomPaddingForTextField => EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);

  bool get isSmallScreen => (height / width) < 1.61;
  void popToHome() => Navigator.of(this).popUntil((route) => route.isFirst);

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.push<T>(this, MaterialPageRoute(builder: (context) => widget, fullscreenDialog: fullscreenDialog));

  void pushReplacement(Widget widget) => Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => widget));
}
