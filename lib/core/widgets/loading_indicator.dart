import 'package:flutter/material.dart';

/// A reusable loading indicator widget.
class LoadingIndicator extends StatelessWidget {
  /// Size of the loading spinner.
  final double size;

  /// Color of the loading spinner.
  final Color color;

  /// Constructs a [LoadingIndicator] with optional size and color.
  const LoadingIndicator({
    super.key,
    this.size = 50.0,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
