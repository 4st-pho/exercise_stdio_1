import 'package:flutter/material.dart';
import 'package:stdio_week_5/constants/my_color.dart';
import 'package:stdio_week_5/constants/my_font.dart';

class MyInputDecoration {
  static const style1 = InputDecoration(
    hintText: 'Title',
    hintStyle: MyFont.secondaryWhite,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: MyColor.lightBlue, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: MyColor.lightBlue,
        width: 0.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: MyColor.lightBlue,
        width: 0.0,
      ),
    ),
    filled: true,
    fillColor: MyColor.lightBlue,
  );
}
