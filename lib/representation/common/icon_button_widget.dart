import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, this.icon, this.onTap});

  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon ?? FontAwesomeIcons.thumbsUp
      ),
    );
  }
}