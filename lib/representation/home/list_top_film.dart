import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/representation/home/film_item_widget.dart';
import 'package:movie_app/representation/home/top_film_item_widget.dart';

class ListTopFilm extends StatefulWidget {
  const ListTopFilm({super.key, this.title});

  final String? title;

  @override
  State<ListTopFilm> createState() => _ListTopFilmState();
}

class _ListTopFilmState extends State<ListTopFilm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 20,),
              TopFilmItemWidget(banner: AssetHelper.largeBannerFilm1, top: 1),
              SizedBox(width: 12,),
              TopFilmItemWidget(banner: AssetHelper.largeBannerFilm1, top: 2),
              SizedBox(width: 12,),
              TopFilmItemWidget(banner: AssetHelper.largeBannerFilm1, top: 3),
              SizedBox(width: 12,),
              TopFilmItemWidget(banner: AssetHelper.largeBannerFilm1, top: 4),
              SizedBox(width: 12,),
              TopFilmItemWidget(banner: AssetHelper.largeBannerFilm1, top: 5),
              SizedBox(width: 20,),
            ]
            
          ),
        )
      ]),
    );
  }
}