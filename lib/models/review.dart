import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    required this.content,
    required this.rating,
    required this.uid,
    this.like = 0,
  });

  String content;
  double rating;
  String uid;
  int like;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        content: json["content"],
        rating: json["rating"].toDouble(),
        uid: json["uid"],
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "rating": rating,
        "uid": uid,
        "like": like,
      };
}

final review1 =
    Review(content: 'Awesome', rating: 2, uid: 'CYipb5ODAYZPoMkxRlQURlTI0XG3');
final review2 =
    Review(content: 'Good', rating: 4, uid: 'NvFPVSSXUMNncxhDsqtOqv0GsNF2');
final review3 =
    Review(content: 'Not bad', rating: 1, uid: 'baUgozb1bpfi0BtA5HcgVKQ9cgB2');
final review4 = Review(
    content: 'Very good', rating: 3, uid: 'nMc9r1TxDcNN70dK0Opik6d1sFB2');
final review5 =
    Review(content: 'Ok', rating: 5, uid: 'sWTMdBkM0vc0Xm5RYQOq0Stmat82');
