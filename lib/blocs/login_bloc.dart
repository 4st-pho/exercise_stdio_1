import 'dart:async';

class LoginBloc {
  bool isPasswordVisible = false;
  final _controller = StreamController<bool>();
  Stream<bool> get stream => _controller.stream;
  void init() {
    _controller.sink.add(isPasswordVisible);
  }

  void toggleShow() {
    isPasswordVisible = !isPasswordVisible;
    _controller.sink.add(isPasswordVisible);
  }

  LoginBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
