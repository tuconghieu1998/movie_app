
import 'package:flutter/material.dart';
import 'package:movie_app/representation/authen/login_screen.dart';
import 'package:movie_app/representation/detail/detail_screen.dart';
import 'package:movie_app/representation/main_app.dart';
import 'package:movie_app/representation/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainApp.routeName: (context) => const MainApp(),
  DetailScreen.routeName: (context) => const DetailScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};