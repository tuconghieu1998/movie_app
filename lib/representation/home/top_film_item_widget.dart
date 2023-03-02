import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';

class TopFilmItemWidget extends StatelessWidget {
  const TopFilmItemWidget({super.key, this.banner, this.top});

  final String? banner;
  final int? top;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageHelper.loadFromAsset(
        banner ?? AssetHelper.largeBannerFilm1,
        width: 298,
        height: 167,
        fit: BoxFit.fitHeight
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            width: 25,
            height: 35,
            decoration: BoxDecoration(
              color: Color(0xffCCB067)
            ),
            child: Center( child: Text((top ?? 1).toString(), style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)),
          )
        ),
      ]
    );
  }
}