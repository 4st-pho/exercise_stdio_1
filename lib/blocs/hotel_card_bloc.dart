import 'dart:async';

import 'package:stdio_week_6/models/hotel.dart';

class HotelCardBloc{
  late int index ;
  final _controller = StreamController<Hotel>();
  Stream<Hotel> get cardStream => _controller.stream;

  void init(String id) {
    index = hotels.indexWhere((hotel) => hotel.id == id);
    _controller.sink.add(hotels[index]);
  }

  void toggleSave(){
    hotels[index].isSave = !hotels[index].isSave;
    _controller.sink.add(hotels[index]);
  }

  void dispose() {
    _controller.close();
  }
}