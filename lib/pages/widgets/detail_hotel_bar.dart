import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/hotel_card_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/map_page.dart';

class DetailHotelBar extends StatefulWidget {
  const DetailHotelBar({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  State<DetailHotelBar> createState() => _DetailHotelBarState();
}

class _DetailHotelBarState extends State<DetailHotelBar> {
  final _hotelCardBloc = HotelCardBloc();
  @override
  void dispose() {
    super.dispose();
    _hotelCardBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(AssetsIcon.back, height: 24),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MapPage(location: widget.hotel.location)));
          },
          icon: Image.asset(AssetsIcon.export, height: 24),
        ),
        IconButton(
          onPressed: () {
            _hotelCardBloc.toggleSave(widget.hotel.id);
          },
          icon: StreamBuilder<List<String>>(
              stream: _hotelCardBloc.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                final data = snapshot.data!;
                return data.contains(widget.hotel.id)
                    ? Image.asset(AssetsIcon.saveActive, height: 24)
                    : Image.asset(AssetsIcon.save, height: 24);
              }),
        ),
      ],
    );
  }
}
