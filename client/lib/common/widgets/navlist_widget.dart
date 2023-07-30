import 'package:flutter/material.dart';

List<Widget> bottomNavList = const <NavigationDestination>[
  NavigationDestination(
    selectedIcon: Icon(Icons.home_filled),
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.favorite),
    icon: Icon(Icons.favorite_border),
    label: 'Favourites',
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.search),
    icon: Icon(Icons.search),
    label: 'Search',
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.person),
    icon: Icon(Icons.person_outline),
    label: 'Profile',
  ),
];
