import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';

class FilmItemWidget extends StatelessWidget {
  const FilmItemWidget({super.key, this.banner});

  final String? banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageHelper.loadFromAsset(
        banner ?? AssetHelper.bannerFilm1,
        width: 102,
        height: 163,
        fit: BoxFit.fitHeight
        ),
    );
  }
}