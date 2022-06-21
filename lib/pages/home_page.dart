import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/widgets/home_bar.dart';
import 'package:stdio_week_6/pages/widgets/hotel_card.dart';
import 'package:stdio_week_6/services/cloud_firestore/hotel_firestore.dart';
import 'package:stdio_week_6/widgets/hotel_card_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            elevation: 0,
            title: HomeBar(context: context),
            toolbarHeight: 80,
            floating: true,
            pinned: true,
            backgroundColor: MyColor.background,
          )
        ];
      },
      body: StreamBuilder<List<Hotel>>(
        stream: HotelFirestore().getHotels,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                HotelCardShimmer(),
                HotelCardShimmer(),
                HotelCardShimmer(),
                HotelCardShimmer(),
              ],
            );
          }
          List<Hotel> listHotel = snapshot.data!;
          hotels = listHotel;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listHotel.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: HotelCard(hotel: hotels[index]),
              );
            },
          );
        },
      ),
    );
  }
}
