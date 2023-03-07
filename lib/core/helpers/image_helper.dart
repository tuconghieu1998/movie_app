import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/constants/network_constants.dart';

class ImageHelper {
 static Widget loadFromAsset(
  String imageFilePath, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imageFilePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      )
    );
 }

 static Widget loadFromUrl(
  String imageUrl, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      )
    );
 }

 static String getImgUrl(String imgName, {String imgSize = "original"}) {
    return "${NetworkConst.imgUrl}/$imgSize$imgName";
 }
}