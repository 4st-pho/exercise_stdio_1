import 'package:flutter/cupertino.dart';
import 'package:stdio_week_6/constants/my_color.dart';

class MyFont {
  static const greySubtitle = TextStyle(fontSize: 14, color: MyColor.grey);
  static const greyLabel = TextStyle(fontSize: 14, color: MyColor.grey);
  static const whiteLabelB = TextStyle(
      fontSize: 14, color: MyColor.white, fontWeight: FontWeight.bold);

  static const blackHeading = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: MyColor.black);
  static const blackText = TextStyle(
      fontSize: 14,  color: MyColor.black);
  static const blackTextSmall = TextStyle(
      fontSize: 12,  color: MyColor.black);
  static const blackTitle = TextStyle(
      fontSize: 14,  color: MyColor.black, fontWeight: FontWeight.bold);
  static const blueHeading =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColor.blue);
}
