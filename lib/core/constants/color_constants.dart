import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6357CC);
  static const Color secondColor = Color(0xff8F67E8);
  static const Color backgroundScaffoldColor = Color(0xffF2F2F2);
  static const Color textColor = Color(0xff313131);
  static const Color buttonColor = Color(0xff4743E0);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.primaryColor,
      ColorPalette.secondColor
    ],
  );
}