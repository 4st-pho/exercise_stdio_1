import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg_logo_1.png',
          height: 127,
        ),
        Positioned(
          left: size.width / 2 - 150,
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
