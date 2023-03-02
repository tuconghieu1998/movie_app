import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/representation/common/top_bar_widget.dart';
import 'package:movie_app/representation/home/home_suggest_film.dart';
import 'package:movie_app/representation/home/list_film.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TopBarWidget(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              HomeSuggestFilm(),
              SizedBox(height: 15,),
              ListFilm(title: "Trending Now"),
            ]),)
        ]
      ),
    );
  }
}