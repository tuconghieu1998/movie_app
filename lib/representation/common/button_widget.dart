import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/color_constants.dart';

import '../../core/constants/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: Gradients.defaultGradientBackground
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)
      ),
    ));
  }
}