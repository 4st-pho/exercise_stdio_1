import 'dart:async';

import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/services/cloud_firestore/user_firestore.dart';

class HotelCardBloc {
  final _controller = StreamController<List<String>>();
  Stream<List<String>> get stream => _controller.stream;

  void init() {
    _controller.sink.add(currenUser.follow);
  }

  void toggleSave(String id) {
    int index = currenUser.follow.indexWhere((element) => element == id);
    if (index >= 0) {
      currenUser.follow.removeAt(index);
    } else {
      currenUser.follow.add(id);
    }
    _controller.sink.add(currenUser.follow);
    UserFirestore().updateFollow(follow: currenUser.follow);
  }

  HotelCardBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
