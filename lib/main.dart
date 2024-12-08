import 'package:flutter/material.dart';
import 'package:tng_assessment/database/session_manager.dart';
import 'package:tng_assessment/favorites/favorites_screen.dart';
import 'package:tng_assessment/home/ui/home_screen.dart';
import 'package:tng_assessment/main/main_screen.dart';
import 'package:tng_assessment/profile/profile_screen.dart';
import 'package:tng_assessment/splash/splash_screen.dart';

import 'details/recipe_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChefWizz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffE8E8E8)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          MainScreen.id: (context) => const MainScreen(),
          RecipeDetailsScreen.id: (context) => const RecipeDetailsScreen(recipeData: null),
          FavoritesScreen.id: (context) => const FavoritesScreen(),
          ProfileScreen.id: (context) => const ProfileScreen()
        }
    );
  }
}

