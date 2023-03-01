import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/color_constants.dart';

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
    fontSize: 14,
    color: ColorPalette.textColor,
    fontWeight: FontWeight.w400,
    height: 16/14
  );
}

extension ExtendedTextStyle on TextStyle {

}