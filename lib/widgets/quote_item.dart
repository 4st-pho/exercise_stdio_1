import 'package:flutter/material.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/model/quote.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem({Key? key, required this.quote}) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: Stack(
        children: [
          FadeInImage.assetNetwork(
            image: quote.imgPath,
            placeholder: 'assets/images/bg_quote.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            placeholderFit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromARGB(96, 39, 39, 39),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '"${quote.quote}"',
                style: MyFont.secondaryWhiteBig,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              right: 30,
              child: Text(
                quote.athor,
                style: MyFont.secondaryWhiteActive,
              ))
        ],
      )),
    );
  }
}
