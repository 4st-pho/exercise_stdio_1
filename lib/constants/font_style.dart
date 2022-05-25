import 'package:exercise_stdio_3/constants/my_color.dart';
import 'package:flutter/material.dart';

class FontStyle {
  static const redTitle = TextStyle(
    color: Colors.red,
    fontSize: 17,
  );
  static const dartBlue = TextStyle(
    color: Color.fromRGBO(45, 53, 110, 1),
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static const dartBlueTitle1 = TextStyle(
    color: MyColor.darkBlue,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static const dartBlueTitle2 = TextStyle(
    color: MyColor.darkBlue,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static const lightBlue = TextStyle(
    color: Colors.blue,
    fontSize: 17,
  );
  static const greyTitle = TextStyle(
    color: Color.fromRGBO(104, 104, 104, 1),
    fontSize: 17,
  );
  static const greySubtitle = TextStyle(
    color: Color.fromARGB(255, 139, 139, 139),
    fontSize: 15,
  );
  static const blueSubtitle = TextStyle(
    color: Colors.blue,
    fontSize: 15,
  );
  static const blackPrimary = TextStyle(
    color: Color.fromARGB(255, 3, 3, 3),
    fontSize: 20,
  );
  static const blackTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const primaryWhite = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontSize: 17,
  );
}
