import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/representation/home/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/dismention_constants.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const String routeName = "/main_app";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
   int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(color: Colors.brown),
          Container(color: Colors.cyan),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
        SalomonBottomBarItem(
          icon: const Icon(
            FontAwesomeIcons.house,
            size: kDefaultIconSize
          ),
          title: Text("Home")
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: kDefaultIconSize
          ),
          title: Text("Search")
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            FontAwesomeIcons.film,
            size: kDefaultIconSize
          ),
          title: Text("Library")
        )
      ],),
    );
     
  }
}