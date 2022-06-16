import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/models/user.dart';

class BookmarkBloc {
  final _controller = StreamController<List<Hotel>>();
  Stream<List<Hotel>> get stream => _controller.stream;

  void init() {
    final hotelList =
        hotels.where((hotel) => currenUser.follow.contains(hotel.id)).toList();
    _controller.sink.add(hotelList);
  }

  BookmarkBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
