import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/hotel_card_bloc.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/get_rating.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/hotel_detail_page.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  final _cardBloc = HotelCardBloc();
  @override
  void dispose() {
    _cardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HotelDetailPage(hotel: widget.hotel)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
                // offset: Offset(0, 7), // changes position of shadow
              ),
            ]),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    widget.hotel.imagePath,
                    height: 162,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                StreamBuilder<List<String>>(
                    stream: _cardBloc.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final data = snapshot.data!;
                      return Positioned(
                        top: 12,
                        right: 12,
                        child: InkWell(
                          onTap: () {
                            _cardBloc.toggleSave(widget.hotel.id);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2)),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: data.contains(widget.hotel.id)
                                  ? Image.asset(
                                      'assets/icons/save_active.png',
                                      height: 16,
                                    )
                                  : Image.asset(
                                      'assets/icons/save.png',
                                      height: 16,
                                    ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(widget.hotel.name, style: MyFont.blackHeading)),
                const SizedBox(width: 10),
                ...getRating(widget.hotel.rating),
                const SizedBox(width: 5),
                Text('${widget.hotel.rating}')
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Image.asset('assets/icons/location.png', height: 14),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  widget.hotel.address,
                  style: MyFont.greySubtitle,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
