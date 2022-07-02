import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/discover_page_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/constants/shimmer_loading.dart';
import 'package:stdio_week_6/pages/search_page.dart';
import 'package:stdio_week_6/pages/widgets/discover_card.dart';
import 'package:stdio_week_6/services/cloud_firestore/hotel_firestore.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _discoverPageBloc = DiscoverPageBloc();

  @override
  void dispose() {
    super.dispose();
    _discoverPageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to comdote!',
                style: MyFont.blackHeading,
              ),
              const SizedBox(height: 10),
              const Text(
                'Alive with your style of living ',
                style: MyFont.blackTitle,
              ),
              const SizedBox(height: 32),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchPage()));
                },
                child: Hero(
                  tag: 'search',
                  child: Material(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      child: SizedBox(
                        height: 53,
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Image.asset(
                              AssetsIcon.searchActive,
                              height: 24,
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              child: Text('Search for hotel, favorite ...',
                                  style: MyFont.greyTitle,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 32),
              DefaultTabController(
                length: 3,
                child: Expanded(
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: false,
                        unselectedLabelColor: MyColor.grey,
                        labelColor: MyColor.blue,
                        labelPadding: EdgeInsets.symmetric(horizontal: 8),
                        tabs: [
                          Tab(text: 'Trending'),
                          Tab(text: 'Popular'),
                          Tab(text: 'Hight rated'),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Flexible(
                          child: SizedBox(
                        height: 300,
                        child: TabBarView(children: [
                          StreamBuilder<List<String>>(
                              stream: HotelFirestore().getTrendingHotels,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ShimmerLoading.listDiscoverCard;
                                }
                                final List<String> hotelIds = snapshot.data!;
                                final hotels = _discoverPageBloc.hotels
                                    .where((element) =>
                                        hotelIds.contains(element.id))
                                    .toList();
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, _) {
                                    return const SizedBox(
                                      width: 30,
                                    );
                                  },
                                  itemCount: hotels.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final hotel = hotels[index];
                                    return DiscoverCard(hotel: hotel);
                                  },
                                );
                              }),
                          StreamBuilder<List<String>>(
                              stream: HotelFirestore().getPopularHotels,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ShimmerLoading.listDiscoverCard;
                                }
                                final List<String> hotelIds = snapshot.data!;
                                final hotels = _discoverPageBloc.hotels
                                    .where((element) =>
                                        hotelIds.contains(element.id))
                                    .toList();
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, _) {
                                    return const SizedBox(
                                      width: 30,
                                    );
                                  },
                                  itemCount: hotels.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final hotel = hotels[index];
                                    return DiscoverCard(hotel: hotel);
                                  },
                                );
                              }),
                          StreamBuilder<List<String>>(
                              stream: HotelFirestore().getHightRatedHotels,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ShimmerLoading.listDiscoverCard;
                                }
                                final List<String> hotelIds = snapshot.data!;
                                final hotels = _discoverPageBloc.hotels
                                    .where((element) =>
                                        hotelIds.contains(element.id))
                                    .toList();
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, _) {
                                    return const SizedBox(
                                      width: 30,
                                    );
                                  },
                                  itemCount: hotels.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final hotel = hotels[index];
                                    return DiscoverCard(hotel: hotel);
                                  },
                                );
                              }),
                        ]),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
