import 'package:chefwizz/core/theme/theme.dart';
import 'package:chefwizz/features/favourites/presentation/screens/favorites_screen.dart';
import 'package:chefwizz/features/home/presentation/screens/home_screen.dart';
import 'package:chefwizz/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenUtilInit(
      designSize: const Size(320, 210),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChefWizz',
        theme: LightTheme.theme,
        home: const MainPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Controller for PersistentTabView
  late PersistentTabController _controller;

  // List of screens for each tab
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
  }

  // List of navigation bar items
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  void initState() {
    // Initialize the controller
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
