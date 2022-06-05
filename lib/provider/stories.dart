import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:stdio_week_5/constants/http.dart';
import 'package:stdio_week_5/model/story.dart';
import 'package:http/http.dart' as http;

class Stories extends ChangeNotifier {
  List<Story> _items = [
    Story(
        id: '1',
        title: 'love',
        content: 'fall in love',
        feeling: 4,
        time: DateTime(2022, 5, 30)),
    Story(
        id: '2',
        title: 'yes',
        content: 'fall in yes',
        feeling: 1,
        time: DateTime(2022, 5, 31)),
    Story(
        id: '3',
        title: 'no',
        content: 'fall in no',
        feeling: 2,
        time: DateTime.now()),
    Story(
        id: '4',
        title: 'yub',
        content: 'fall in yub',
        feeling: 3,
        time: DateTime(2022, 5, 29)),
  ];
  List<Story> get getStories => [..._items];

  Future<String> fetchAndSetStories() async {
    String message = 'ok';
    try {
      final response =
          await http.get(Uri.https(HttpAppInfo.url, 'stories.json'));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _items = [];
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        data.forEach((id, value) {
          _items.add(Story(
              id: id,
              title: value['title'],
              content: value['content'],
              feeling: value['feeling'],
              time: DateTime.parse(value['time'])));
        });
        notifyListeners();
      }
    } catch (e) {
      message = e.toString();
    }
    return message;
  }

  Future<String> deleteStory(String id) async {
    String message = 'ok';
    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      Story temp = _items[index];
      _items.removeAt(index);
      notifyListeners();
      try {
        final response = await http.delete(
          Uri.https(HttpAppInfo.url, '/stories/$id.json'),
        );
        final statusCode = response.statusCode;
        if (statusCode >= 200 && statusCode <= 299) {
          return message;
        } else if (response.statusCode >= 400) {
          _items.insert(index, temp);
          notifyListeners();
        }
      } catch (e) {
        message = e.toString();
      }
    }
    return message;
  }

  Future<String> addStory({
    required String title,
    required String content,
    required double feeling,
  }) async {
    String message = 'ok';
    final timeNow = DateTime.now();
    try {
      final response = await http.post(
        Uri.https(HttpAppInfo.url, 'stories.json'),
        body: storyToJson(
          Story(
            id: 'id',
            title: title,
            content: content,
            feeling: feeling,
            time: timeNow,
          ),
        ),
      );
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode <= 299) {
        _items.add(
          Story(
              id: jsonDecode(response.body)['name'],
              title: title,
              content: content,
              feeling: feeling,
              time: timeNow),
        );
      }
    } catch (e) {
      message = e.toString();
    }
    return message;
  }

  Future<String> updateStory(Story story) async {
    String message = 'ok';
    final index = _items.indexWhere((element) => element.id == story.id);
    try {
     
      final response = await http.patch(
        Uri.https(HttpAppInfo.url, '/stories/${story.id}.json'),
        body: storyToJson(story),
      );
      if (response.statusCode <= 299) {
        _items[index] = story;
        notifyListeners();
      }
      if (response.statusCode >= 300) message == 'error';
    } catch (e) {
      message = e.toString();
    }
    return message;
  }
}
