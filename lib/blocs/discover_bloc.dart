import 'dart:async';

import 'package:stdio_week_6/helper/debounce.dart';
import 'package:stdio_week_6/models/hotel.dart';

class DiscoverBloc {
  final _controller = StreamController<List<Hotel>>();

  Stream<List<Hotel>> get stream => _controller.stream;

  final debounce = Debounce(milliseconds: 1000);
  void init() {
    _controller.sink.add([]);
  }

  void query(String content) {
    content = content.toLowerCase();
    debounce.run(() {
      List<Hotel> newList = hotels
          .where((hotel) => hotel.name.toLowerCase().contains(content))
          .toList();
      _controller.sink.add(newList);
    });
  }

  DiscoverBloc() {
    init();
  }

  void dispose() {
    _controller.close();
    debounce.dispose();
  }
}
