import 'package:flutter/material.dart';
import 'package:tng_assessment/favorites/favorites_screen.dart';
import 'package:tng_assessment/profile/profile_screen.dart';

import '../home/ui/home_screen.dart';

final ValueNotifier<bool> favoritesNotifier = ValueNotifier(false);
class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          HomeScreen(),
          FavoritesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        elevation: 0,
        selectedFontSize: 14,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedItemColor: Color(0xffE8E8E8),
        selectedItemColor: Color(0xffFFBA38),
        enableFeedback: true,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 22,),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,size: 22,color: _currentIndex == 1 ? const Color(0xffFFBA38) : Color(0xffE8E8E8),),
              label: "Favorites"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 22,),
              label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}
