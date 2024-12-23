import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: const [
        HomeRoute(),
        FavoritesRoute(),
        ProfileRoute(),
      ],
      animationDuration: const Duration(milliseconds: 10000),
      transitionBuilder: (_, child, __) => child,
      bottomNavigationBuilder: (context, tabRouter) {
        return Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                blackColor.withOpacity(0.8),
                blackColor,
              ],
            ),
          ),
          padding: const EdgeInsets.only(bottom: 24),
          child: AppBottomNavigationBar(
            activeIndex: tabRouter.activeIndex,
            onChanged: tabRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
