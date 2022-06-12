import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';

class Homebloc {
  final _controller = StreamController<List<Hotel>>();
  Stream<List<Hotel>> get listHotelStream => _controller.stream;

  void init() {
    _controller.sink.add(hotels);
  }

  void dispose() {
    _controller.close();
  }
}
