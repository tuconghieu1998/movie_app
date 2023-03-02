import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/representation/home/film_item_widget.dart';

class ListFilm extends StatefulWidget {
  const ListFilm({super.key, this.title});

  final String? title; 

  @override
  State<ListFilm> createState() => _ListFilmState();
}

class _ListFilmState extends State<ListFilm> {
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
              FilmItemWidget(banner: AssetHelper.bannerFilm1),
              SizedBox(width: 12,),
              FilmItemWidget(banner: AssetHelper.bannerFilm2),
              SizedBox(width: 12,),
              FilmItemWidget(banner: AssetHelper.bannerFilm1),
              SizedBox(width: 12,),
              FilmItemWidget(banner: AssetHelper.bannerFilm2),
              SizedBox(width: 20,),
            ]
            
          ),
        )
      ]),
    );
  }
}