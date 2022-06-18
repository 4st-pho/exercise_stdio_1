import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg_logo_1.png',
          height: 127,
          width: 186,
        ),
        Positioned(
          left: 186 / 2 - 50,
          bottom: 0,
          child: Image.asset(
            'assets/images/logo_1.png',
            height: 100,
          ),
        ),
      ],
    );
  }
}
