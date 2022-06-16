import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';

class Homebloc {
  final _controller = StreamController<List<Hotel>>();
  Stream<List<Hotel>> get stream => _controller.stream;

  void init() {
    _controller.sink.add(hotels);
  }

  Homebloc(){
    init();
  }
  void dispose() {
    _controller.close();
  }
}
