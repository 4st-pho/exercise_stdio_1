import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg_logo_1.png',
          height: 200,
        ),
        Positioned(
          bottom: 0,
          left: 43,
          child: Image.asset(
            'assets/images/logo_1.png',
            height: 100,
          ),
        ),
      ],
    );
  }
}
