import 'package:flutter/material.dart';
import 'package:movie_app/representation/splash_screen.dart';
import 'package:movie_app/routes.dart';
import 'core/constants/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
