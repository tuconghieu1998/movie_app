import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:movie_app/core/model/movie_detail.dart';
import 'package:movie_app/network/network_request.dart';
import 'package:movie_app/representation/detail/detail_screen.dart';

class FilmItemWidget extends StatelessWidget {
  const FilmItemWidget({super.key, this.banner, this.imgUrl, this.movieId});

  final String? banner;
  final String? imgUrl;
  final int? movieId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(movieId != null) {
          NetworkRequest.getMovieDetail(movieId ?? 0).then((detail) {
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
                settings: RouteSettings(
                  arguments: detail
                )
              ));
          });
        }
      },
      child: Container(
      child: imgUrl != null ? 
      ImageHelper.loadFromUrl(
        imgUrl ?? "",
        width: 102,
        height: 163,
        fit: BoxFit.fitHeight
        )
      : ImageHelper.loadFromAsset(
        banner ?? AssetHelper.bannerFilm1,
        width: 102,
        height: 163,
        fit: BoxFit.fitHeight
        ),
    )
    );
  }
}