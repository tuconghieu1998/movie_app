import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/constants/color_constants.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:movie_app/representation/common/button_widget.dart';
import 'package:movie_app/representation/common/icon_button_widget.dart';
import 'package:movie_app/representation/home/list_film.dart';

import '../../network/network_request.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  static const String routeName = "/detail_film";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ImageHelper.loadFromAsset(AssetHelper.largeBannerFilm1,
                height: 350, fit: BoxFit.fitHeight),
            Positioned(
              left: 0,
              right: 0,
              top: 250,
              height: 100,
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
 SizedBox(height: 12),
            Text(
              "Silver Linings PlayBook",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Comedy . Drama . Romance",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),

            Text(
              "2012 . HD . 18+ . 2h2m",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              "Are you starting a website redesign project or creating a new webpage from scratch? The way forward can seem daunting, but formulating a thorough content plan beforehand will help simplify the process by laying the framework for the entire project.",
              style: TextStyle(fontSize: 14, color: ColorPalette.textColor),
            ),
            SizedBox(height: 12,),
            ButtonWidget(title: "Play"),
            SizedBox(height: 12,),
            ButtonWidget(title: "Download", onTap: (() => {
              NetworkRequest.fetchPosts().then((data) => {})
            }),),

            ]),
            ),
            SizedBox(height: 20,),
            ListFilm(title: "More Like This"),
            SizedBox(height: 20,),
          ]),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: (){
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
