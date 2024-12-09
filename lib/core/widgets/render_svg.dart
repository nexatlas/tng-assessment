import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RenderSvg extends StatelessWidget {
  final String svgPath;
  final String? semantics;
  final double? height;
  final double? width;
  final Color? color;

  const RenderSvg({
    super.key,
    required this.svgPath,
    this.semantics = "",
    this.height,
    this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: height,
      width: width,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
