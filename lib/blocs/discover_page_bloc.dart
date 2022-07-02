import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/services/cloud_firestore/hotel_firestore.dart';

class DiscoverPageBloc {
  List<Hotel> hotels = [];

  final _controller = StreamController<User>();
  Stream<User> get stream => _controller.stream;
  void init() async {
    hotels = await HotelFirestore().getAllHotel();
  }

  DiscoverPageBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
