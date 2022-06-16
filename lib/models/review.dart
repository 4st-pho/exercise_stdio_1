import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    required this.id,
    required this.content,
    required this.rating,
    required this.uid,
    this.like = 0,
  });

  String id;
  String content;
  double rating;
  String uid;
  int like;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        content: json["content"],
        rating: json["rating"].toDouble(),
        uid: json["uid"],
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "rating": rating,
        "uid": uid,
        "like": like,
      };
}

final review1 = Review(id: 'c1', content: 'Awesome', rating: 2.5, uid: 'u1');
final review2 = Review(id: 'c2', content: 'Good', rating: 4.5, uid: 'u2');
final review3 = Review(id: 'c3', content: 'Not bad', rating: 1.5, uid: 'u3');
final review4 = Review(id: 'c4', content: 'Very good', rating: 3, uid: 'u4');
