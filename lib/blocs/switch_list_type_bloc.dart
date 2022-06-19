import 'dart:async';

class SwitchListTypeBloc {
  bool isGrid = false;
  final _controller = StreamController<bool>();
  Stream<bool> get stream => _controller.stream;
  void init() {
    _controller.sink.add(isGrid);
  }

  void toggleListType() {
    isGrid = !isGrid;
    _controller.sink.add(isGrid);
  }

  SwitchListTypeBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
