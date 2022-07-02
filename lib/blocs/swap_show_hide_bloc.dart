import 'dart:async';

class SwapShowHideBloc {
  bool isVisible = false;
  final _controller = StreamController<bool>();
  Stream<bool> get stream => _controller.stream;
  void init() {
    _controller.sink.add(isVisible);
  }

  void toggleShow() {
    isVisible = !isVisible;
    _controller.sink.add(isVisible);
  }

  SwapShowHideBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
