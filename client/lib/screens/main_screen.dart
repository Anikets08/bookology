import 'package:bookology/common/widgets/navlist_widget.dart';
import 'package:bookology/screens/nav_screens/fav_screen.dart';
import 'package:bookology/screens/nav_screens/home_screen.dart';
import 'package:bookology/screens/nav_screens/profile_Screen.dart';
import 'package:bookology/screens/nav_screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: bottomNavList,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          FavScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
