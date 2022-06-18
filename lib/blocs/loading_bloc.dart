import 'dart:async';

class LoadingBloc {
  bool isLoading = false;
  final _controller = StreamController<bool>();
  Stream<bool> get stream => _controller.stream;
  void init() {
    _controller.sink.add(isLoading);
  }

  void toggleState() {
    isLoading = !isLoading;
    _controller.sink.add(isLoading);
  }

  LoadingBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
