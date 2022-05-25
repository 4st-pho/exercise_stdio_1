import 'package:exercise_stdio_3/models/user.dart';

class Event {
  int id;
  String name;
  String pathImage;
  String locationName;
  String description;
  DateTime timeStart;
  DateTime timeEnd;
  User organiser;
  String price;
  String link;
  bool isLike;
  bool isGoing;
  Event({
    required this.id,
    required this.name,
    required this.pathImage,
    required this.locationName,
    required this.description,
    required this.timeStart,
    required this.timeEnd,
    required this.organiser,
    required this.price,
    required this.link,
    required this.isLike,
    required this.isGoing,
  });
}
