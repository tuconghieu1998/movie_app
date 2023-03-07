import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/network/network_request.dart';
import 'package:movie_app/representation/common/button_widget.dart';
import 'package:movie_app/representation/common/top_bar_widget.dart';
import 'package:movie_app/representation/home/home_suggest_film.dart';
import 'package:movie_app/representation/home/list_film.dart';
import 'package:movie_app/representation/home/list_top_film.dart';

import '../../core/model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? _trendingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTrendingMovies().then((value){
      setState(() {
        _trendingMovies = value;
      });
    });
  }

  Future<List<Movie>> _loadTrendingMovies() async {
    return await NetworkRequest.getTrendingMovies().then((movies) {
      return movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
              HomeSuggestFilm(),
              SizedBox(height: 15,),
              SizedBox(height: 15,),
              ListFilm(title: "Trending Now", movies: _trendingMovies ?? []),
              SizedBox(height: 35,),
              ListTopFilm(title: "Top 10 Movies in US today"),
              SizedBox(height: 15,),
            ]),),
          TopBarWidget(),
        ]
      ),
    );
  }
}