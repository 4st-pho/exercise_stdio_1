import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stdio_week_6/helper/debounce.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/search_result_page.dart';

class DiscoverBloc {
  final _controller = StreamController<List<Hotel>>();
  List<Hotel> result = hotels;
  Stream<List<Hotel>> get stream => _controller.stream;

  final debounce = Debounce(milliseconds: 1000);
  void init() {
    _controller.sink.add(result.take(5).toList());
  }

  void query(String content) {
    content = content.toLowerCase();
    debounce.run(() {
      result = hotels
          .where((hotel) => hotel.name.toLowerCase().contains(content))
          .toList();
      _controller.sink.add(result);
    });
  }

  void goResultPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultPage(result: result)));
  }

  DiscoverBloc() {
    init();
  }

  void dispose() {
    _controller.close();
    debounce.dispose();
  }
}
