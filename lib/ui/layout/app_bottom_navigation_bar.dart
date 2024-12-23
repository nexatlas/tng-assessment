import 'package:chef_wizz/ui/ui.dart';
import 'package:chef_wizz/utils/utils.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.activeIndex,
    required this.onChanged,
    super.key,
  });
  final int activeIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocalizations;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.12),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: greyColor.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomNavigationBarItem(
            title: locale.home,
            activeIcon: const Icon(Icons.home),
            inActiveIcon: const Icon(Icons.home_outlined),
            isActive: activeIndex == 0,
            maxWidth: 110,
            onTap: () => onChanged(0),
          ),
          const SizedBox(width: 8),
          AppBottomNavigationBarItem(
            title: locale.favorites,
            inActiveIcon: const Icon(Icons.favorite_border_outlined),
            activeIcon: const Icon(Icons.favorite),
            isActive: activeIndex == 1,
            maxWidth: 134,
            onTap: () => onChanged(1),
          ),
          const SizedBox(width: 8),
          AppBottomNavigationBarItem(
            title: locale.profile,
            inActiveIcon: const Icon(Icons.person_outline_rounded),
            activeIcon: const Icon(Icons.person),
            isActive: activeIndex == 2,
            maxWidth: 124,
            onTap: () => onChanged(2),
          ),
        ],
      ),
    );
  }
}
