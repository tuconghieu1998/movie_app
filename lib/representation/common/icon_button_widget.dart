import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, this.icon, this.onTap, this.size});

  final IconData? icon;
  final Function()? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FaIcon(
        icon ?? FontAwesomeIcons.thumbsUp,
        size: size ?? 24,
      ),
    );
  }
}