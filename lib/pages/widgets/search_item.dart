import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/hotel_detail_page.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HotelDetailPage(hotel: hotel)));
      },
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.network(
              hotel.imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotel.name,
                  style: MyFont.blackText, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Text(hotel.address,
                  style: MyFont.greySubtitle, overflow: TextOverflow.ellipsis),
            ],
          )),
        ],
      ),
    );
  }
}
