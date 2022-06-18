import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ChangeImageBloc {
  final _controller = StreamController<File?>();
  Stream<File?> get stream => _controller.stream;
  void init() {
    _controller.sink.add(null);
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _controller.sink.add(File(image.path));
  }

  ChangeImageBloc() {
    init();
  }
  void dispose() {
    _controller.close();
  }
}
