import 'package:flutter/material.dart';

List<Widget> getRating(double rating, {double height = 16}) {
  int start = rating.round();
  final starYellow = List.generate(
    start,
    (_) => Padding(
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        'assets/icons/star.png',
        height: height,
      ),
    ),
  );
  final starGrey = List.generate(
    5 - start,
    (_) => Padding(
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        'assets/icons/star_grey.png',
        height: height,
      ),
    ),
  );
  return [...starYellow, ...starGrey];
}
