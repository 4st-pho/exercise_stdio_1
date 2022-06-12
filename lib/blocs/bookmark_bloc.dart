import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';

class BookmarkBloc {
  final _controller = StreamController<List<Hotel>>();
  Stream<List<Hotel>> get listHotelStream => _controller.stream;

  void init() {
     final hotelList = hotels.where((hotel) => hotel.isSave ).toList();
    _controller.sink.add(hotelList);
  }

  void dispose() {
    _controller.close();
  }
}
