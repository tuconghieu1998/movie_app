import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/helpers/asset_helper.dart';
import 'package:movie_app/core/helpers/image_helper.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ImageHelper.loadFromAsset(AssetHelper.avatar, width: 48, height: 48, radius: BorderRadius.circular(48)),
    );
  }
}