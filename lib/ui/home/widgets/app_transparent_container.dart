import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

class AppTransparentContainer extends StatelessWidget {
  const AppTransparentContainer({
    required this.child,
    super.key,
    this.borderColor,
    this.radius,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
    this.shape = BoxShape.rectangle,
  });
  final Color? borderColor;
  final Color? backgroundColor;
  final Radius? radius;
  final EdgeInsets padding;
  final Widget child;
  final double? height;
  final double? width;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? greyColor.withOpacity(0.1)),
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.all(radius ?? const Radius.circular(24)),
        color: backgroundColor ?? whiteColor.withOpacity(0.1),
        shape: shape,
      ),
      child: child,
    );
  }
}
