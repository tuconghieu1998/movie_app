import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/representation/common/avatar_widget.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
       boxShadow: [
          BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(AssetHelper.logo, width: 48, height: 48, radius: BorderRadius.circular(8)),
          Spacer(),
          GestureDetector(
            child: Icon(FontAwesomeIcons.bell)
          ),
          SizedBox(width: 20,),
          AvatarWidget(),
        ],
      ),
    );
  }
}