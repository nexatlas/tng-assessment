import 'dart:async';

import 'package:chef_wizz/app/app_bloc_observer.dart';
import 'package:chef_wizz/app/app_locator.dart';
import 'package:chef_wizz/core/core.dart';
import 'package:chef_wizz/features/features.dart';
import 'package:chef_wizz/gen/fonts.gen.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:chef_wizz/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      await dotenv.load();
      await setUpLocator();
      await AppStorage.init();
      Bloc.observer = AppBlocObserver();
      runApp(MainApp());
    },
    (error, stackTrace) async {},
  );
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}

class MainApp extends HookWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocalizations;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: locale.chefWizz,
      theme: ThemeData(
        fontFamily: FontFamily.satoshi,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        textTheme: const TextTheme(
          /// This enables global bodyColor
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        locator.registerSingleton<AppRouter>(_appRouter);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (context) => RecipeCubit()..getRecipes(),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => RecipeFavoritesCubit()..getFavoriteRecipes(),
            ),
          ],
          child: ResponsiveBreakpoints.builder(
            child: Unfocus(child: child!),
            breakpoints: [
              const Breakpoint(start: 0, end: 390, name: MOBILE),
              const Breakpoint(start: 391, end: 600, name: TABLET),
              const Breakpoint(start: 601, end: 800, name: DESKTOP),
            ],
          ),
        );
      },
    );
  }
}
