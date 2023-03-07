import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constants/color_constants.dart';
import 'package:movie_app/core/constants/network_constants.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:movie_app/core/model/movie.dart';
import 'package:movie_app/core/model/movie_detail.dart';
import 'package:movie_app/representation/common/button_widget.dart';
import 'package:movie_app/representation/common/icon_button_widget.dart';
import 'package:movie_app/representation/home/list_film.dart';

import '../../core/helpers/utility_helper.dart';
import '../../network/network_request.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  static const String routeName = "/detail_film";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Movie>? _relatedMovies;

  String _convertGenresToString(List<Genres> genres) {
    var concatenate = StringBuffer();
    for (int i = 0; i < genres.length; i++) {
      concatenate.write(genres[i].name);
      if (i < genres.length - 1) {
        concatenate.write(" . ");
      }
    }
    return concatenate.toString();
  }

  Future<List<Movie>> _loadRelatedMovies(int movieId) async {
    return await NetworkRequest.getRelatedMovies(movieId).then((movies) {
      return movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as MovieDetail;
    if(data != null) {
     _loadRelatedMovies(data.id ?? 0).then((value){
        setState(() {
          _relatedMovies = value;
        });
      });
    }

    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageHelper.loadFromUrl(
                ImageHelper.getImgUrl(data.backdropPath ?? "", imgSize: "w1280"),
                height: 350,
                fit: BoxFit.fitHeight),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      data.title ?? "",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      _convertGenresToString(data.genres ?? []),
                      // "Comedy . Drama . Romance",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${data.releaseDate?.split("-")[0]}${data.adult == true ? " . 18+" : ""} . ${Utility.formatDuration(data.runtime ?? 0)}",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.overview ?? "",
                      style: TextStyle(
                          fontSize: 14, color: ColorPalette.textColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(title: "Play"),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      title: "Download",
                      onTap: (() => {
                            //NetworkRequest.fetchPosts().then((data) => {})
                          }),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            ListFilm(title: "Like More This", movies: _relatedMovies ?? []),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
                child: Icon(FontAwesomeIcons.arrowLeft),
              ),
            ))
      ]),
    ));
  }
}
