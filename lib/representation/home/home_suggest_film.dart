import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:movie_app/representation/common/icon_button_widget.dart';
import 'package:movie_app/representation/common/play_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSuggestFilm extends StatefulWidget {
  const HomeSuggestFilm({super.key});

  @override
  State<HomeSuggestFilm> createState() => _HomeSuggestFilmState();
}

class _HomeSuggestFilmState extends State<HomeSuggestFilm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Good Morning, Hieu",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            ImageHelper.loadFromAsset(AssetHelper.largeBannerFilm1),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.8)),
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Argo", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Suspenseful . Thriller . Political"),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  IconButtonWidget(icon: FontAwesomeIcons.thumbsUp),
                                  SizedBox(width: 12,),
                                  IconButtonWidget(icon: FontAwesomeIcons.plus,),
                                  SizedBox(width: 12,),
                                  IconButtonWidget(icon: FontAwesomeIcons.circleInfo),
                                ],
                              )
                            ]),
                        Spacer(),
                        PlayButtonWidget(),
                      ],
                    ))),
          ],
        )
      ]),
    );
  }
}
