import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/get_rating.dart';

class HotelInfo extends StatelessWidget {
  const HotelInfo(
      {Key? key,
      required this.name,
      required this.address,
      required this.rating})
      : super(key: key);
  final String name;
  final String address;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: MyFont.blackHeading,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ...getRating(
              rating,
            ),

        const SizedBox(width: 8),
            Text('$rating')
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Image.asset('assets/icons/location.png', height: 14),
            const SizedBox(width: 10),
            Expanded(
                child: Text(
              address,
              style: MyFont.greySubtitle,
            ))
          ],
        )
      ],
    );
  }
}