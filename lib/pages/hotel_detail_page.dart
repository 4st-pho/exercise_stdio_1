import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/widgets/review_hotel.dart';
import 'package:stdio_week_6/pages/widgets/description.dart';
import 'package:stdio_week_6/pages/widgets/detail_hotel_bar.dart';
import 'package:stdio_week_6/pages/widgets/hotel_info.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final reviews = hotel.reviews;
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: DetailHotelBar(hotel: hotel),
          toolbarHeight: 60,
          backgroundColor: MyColor.grey,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              hotel.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(32),
              child: Container(
                width: double.infinity,
                height: 32,
                decoration: const BoxDecoration(
                    color: MyColor.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HotelInfo(
                    name: hotel.name,
                    address: hotel.address,
                    rating: hotel.rating),
                const SizedBox(height: 28),
                Description(text: hotel.description),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Reviews', style: MyFont.blueTitle),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(28))),
                          context: context,
                          builder: (context) => ReviewHotel(reviews: reviews)),
                      child: Text(
                        'See more',
                        style: MyFont.blackText
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ReviewHotel(reviews: reviews),
        )
      ]),
    );
  }
}
