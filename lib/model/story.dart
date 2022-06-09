import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:stdio_week_5/constants/http.dart';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story with ChangeNotifier {
  Story({
    required this.id,
    required this.title,
    required this.content,
    required this.feeling,
    required this.time,
  });

  final String id;
  String title;
  String content;
  double feeling;
  final DateTime time;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        feeling: json["feeling"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "feeling": feeling,
        "time": time.toIso8601String(),
      };

  Future<String> updateStory(
      {required String title,
      required String content,
      required double feeling}) async {
    String message = 'ok';
    this.title = title;
    this.content = content;
    this.feeling = feeling;
    try {
      final response = await http.patch(
        Uri.https(HttpAppInfo.url, '/stories/$id.json'),
        body: storyToJson(
          Story(
              id: id,
              title: title,
              content: content,
              feeling: feeling,
              time: time),
        ),
      );
      if (response.statusCode >= 300) message == 'error';
    } catch (e) {
      message = e.toString();
    }
    return message;
  }
}
