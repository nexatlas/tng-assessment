import 'package:chef_wizz/gen/assets.gen.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

class ScaffoldLayout extends StatelessWidget {
  const ScaffoldLayout({
    super.key,
    required this.child,
    this.padding,
    this.resizeToAvoidBottomInset = true,
  });

  /// Child
  final Widget child;

  /// Padding
  final EdgeInsets? padding;

  /// Resize to avoid bottom inset
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 347,
              child: AppAssets.images.patternBot.svg(
                width: size.width,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppAssets.images.bgColor.image(
                width: size.width,
                height: 0.5 * size.height,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
