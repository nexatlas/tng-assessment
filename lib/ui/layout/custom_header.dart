import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.trailing,
  });

  /// Title
  final String title;

  /// Show back button
  final bool showBackButton;

  /// Trailing
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (showBackButton)
          Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              onPressed: context.router.maybePop,
              padding: EdgeInsets.zero,
              child: const AppBackButton(),
            ),
          ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
        ),
        if (trailing != null)
          Align(
            alignment: Alignment.centerRight,
            child: trailing,
          ),
      ],
    );
  }
}
