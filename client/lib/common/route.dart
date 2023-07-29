import 'package:bookology/screens/getinfo_screen.dart';
import 'package:bookology/screens/main_screen.dart';
import 'package:bookology/screens/splash_Screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => const SplashScreen(),
  "/main": (BuildContext context) => const MainScreen(),
  "/getinfo": (BuildContext context) => const GetInfoScreen(),
};
