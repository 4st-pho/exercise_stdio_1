import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/hotel_card_bloc.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/map_page.dart';
import 'package:stdio_week_6/pages/widgets/bottom_review.dart';
import 'package:stdio_week_6/pages/widgets/description.dart';
import 'package:stdio_week_6/pages/widgets/hotel_info.dart';
import 'package:stdio_week_6/pages/widgets/review.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  final _hotelCardBloc = HotelCardBloc();
  @override
  void dispose() {
    super.dispose();
    _hotelCardBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final reviews = widget.hotel.comments;
    _hotelCardBloc.init(widget.hotel.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 50,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset('assets/icons/back.png', height: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MapPage(location: widget.hotel.location)));
            },
            icon: Image.asset('assets/icons/export.png', height: 24),
          ),
          IconButton(
            onPressed: () {
              _hotelCardBloc.toggleSave();
            },
            icon: StreamBuilder<Hotel>(
                stream: _hotelCardBloc.cardStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }
                  final data = snapshot.data!;
                  return data.isSave
                      ? Image.asset('assets/icons/save_active.png', height: 24)
                      : Image.asset('assets/icons/save.png', height: 24);
                }),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.network(
              widget.hotel.imagePath,
              height: 318,
              fit: BoxFit.cover,
              width: size.width,
            ),
          ),
          Positioned(
            top: 290,
            child: Container(
              padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28))),
              height: size.height - 290,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HotelInfo(
                          name: widget.hotel.name,
                          address: widget.hotel.address,
                          rating: widget.hotel.rating),
                      const SizedBox(height: 28),
                      Description(text: widget.hotel.description),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Reviews', style: MyFont.blueHeading),
                          InkWell(
                            onTap: () => showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(28))),
                                context: context,
                                builder: (context) =>
                                    BottomReview(reviews: reviews)),
                            child: Text(
                              'See more',
                              style: MyFont.blackText.copyWith(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      reviews.isEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('The hotel don\'t have any comment')
                              ],
                            )
                          : reviews.length == 1
                              ? Review(comment: reviews[0])
                              : Column(
                                  children: [
                                    Review(comment: reviews[0]),
                                    Review(comment: reviews[1]),
                                  ],
                                )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
