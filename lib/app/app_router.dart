import 'package:chef_wizz/ui/ui.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: '/base',
          page: BaseRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          barrierColor: Colors.transparent,
          children: [
            CustomRoute(
              path: 'home',
              page: HomeRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              barrierColor: Colors.transparent,
            ),
            CustomRoute(
              path: 'favorites',
              page: FavoritesRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              barrierColor: Colors.transparent,
            ),
            CustomRoute(
              path: 'profile',
              page: ProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              barrierColor: Colors.transparent,
            ),
          ],
        ),
      ];
}
