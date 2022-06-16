import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/pages/add_hotel_page.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello Linh,",style: MyFont.blackHeading),
              const SizedBox(height: 10),
              RichText(
                  text: const TextSpan(style: MyFont.blackHeading, children: [
                TextSpan(text: 'Explore '),
                TextSpan(text: 'New Hotel', style: MyFont.blueHeading),
              ])),
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddHotelPage()));
              },
              icon: Image.asset('assets/icons/add.png', height: 24))
        ],
      ),
    );
  }
}
