import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constants/color_constants.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: ColorPalette.buttonColor,
        borderRadius: BorderRadius.circular(48)
      ),
      child: Icon(
        FontAwesomeIcons.play,
        ),
    )
    ) ;
  }
}