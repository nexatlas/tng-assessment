import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBarItem extends StatelessWidget {
  const AppBottomNavigationBarItem({
    required this.title,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.isActive,
    required this.onTap,
    this.maxWidth = 98,
    super.key,
  });

  final Widget activeIcon;
  final Widget inActiveIcon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: !isActive ? 56 : maxWidth,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.08),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: greyColor.withOpacity(0.1)),
        ),
        child: ClipRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isActive) activeIcon else inActiveIcon,
              if (isActive)
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
