import 'package:flutter/cupertino.dart';

class SliderStateProvider extends ChangeNotifier {
  final double feeling = 2;
  void setFeeling(double feeling) {
    feeling = feeling;
    notifyListeners();
  }
}
