import 'package:stdio_week_6/models/user.dart';

class Comment {
  Comment(
      {required this.id,
      required this.content,
      required this.rating,
      required this.user,
      this.like = 0});
  final String id;
  String content;
  double rating;
  User user;
  int like;
}

final comment1 = Comment(id: 'c1', content: 'Awesome',rating: 2.5,  user: user1);
final comment2 = Comment(id: 'c2', content: 'Good',rating: 4.5, user: user3);
final comment3 = Comment(id: 'c3', content: 'Not bad',rating: 1.5, user: user2);
final comment4 = Comment(id: 'c4', content: 'Very good',rating: 3, user: user4);
