
import 'package:flutter/material.dart';
import 'package:movie_app/representation/main_app.dart';
import 'package:movie_app/representation/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainApp.routeName: (context) => const MainApp(),
};