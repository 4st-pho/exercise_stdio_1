import 'package:exercise_stdio_3/constants/constants.dart';
import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  final String pathImage;
  final String text;
  final Color backgroundColor;
  final TextStyle font;
  const ImageContent(
      {required this.pathImage,
      required this.backgroundColor,
      required this.font,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Hero(
          tag: pathImage,
          child: FadeInImage.assetNetwork(
            placeholder: Constants.imagePlaceholderPath,
            image: pathImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        left: 20,
        bottom: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: text.toUpperCase() == "FREE"
                ? Text(
                    text,
                    style: font,
                  )
                : Text('\$$text', style: font),
          ),
        ),
      ),
    ]);
  }
}
