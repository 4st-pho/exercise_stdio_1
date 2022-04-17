import 'package:flutter/foundation.dart';

class Restaurant with ChangeNotifier {
  final String id;
  final String name;
  final String title;
  final String address;
  final List<String> imageUrl;
  bool favorite;
  Restaurant(
      {required this.id,
      required this.name,
      required this.title,
      required this.address,
      required this.imageUrl,
      this.favorite = false});
}
