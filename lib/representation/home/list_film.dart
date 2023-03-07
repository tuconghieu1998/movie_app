import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/constants/network_constants.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:movie_app/representation/home/film_item_widget.dart';

import '../../core/model/movie.dart';
import '../../network/network_request.dart';
import '../common/button_widget.dart';

class ListFilm extends StatefulWidget {
  const ListFilm({super.key, this.title, this.movies});

  final String? title;
  final List<Movie>? movies;

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
          // ButtonWidget(title: "Reload", onTap: () {
          //   print("Tap Loading Trending");
          //       NetworkRequest.getTrendingMovies().then((movies) {
          //         print("Loading Trending ${movies.length}");
          //         setState(() {
          //           _movies = movies;
          //         });
          //       });
          //     },),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: 
              StatefulBuilder(builder: (context, setState) {
                //print("Render Movie ${(_movies?? []).length}");
                return Row(
                  children: [
                    SizedBox(width: 20,),
                    ...
                    (widget.movies ?? []).map((movie) {
                      return Row(children: [
                        FilmItemWidget(imgUrl: ImageHelper.getImgUrl(movie.posterPath ?? "", imgSize: "w154"), movieId: movie.id,),
                        SizedBox(width: 12,),
                      ],);
                        
                    }).toList(),
                    SizedBox(width: 8,),
                  ]
                    

                
              //   FilmItemWidget(banner: AssetHelper.bannerFilm1),
              // SizedBox(width: 12,),
              // FilmItemWidget(banner: AssetHelper.bannerFilm2),
              // SizedBox(width: 12,),
              // FilmItemWidget(banner: AssetHelper.bannerFilm1),
              // SizedBox(width: 12,),
              // FilmItemWidget(banner: AssetHelper.bannerFilm2),
              // SizedBox(width: 20,),
                
            
          );
              })
              
            
        )
      ]),
    );
  }
}