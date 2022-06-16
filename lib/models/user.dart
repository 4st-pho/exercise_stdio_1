import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.follow,
      });

  String id;
  String name;
  String avatar;
  List<String> follow = [];

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        follow: List<String>.from(json["follow"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "follow": List<dynamic>.from(follow.map((x) => x)),
      };
}

final currenUser = User(
  id: 'u1',
  name: 'Jack',
  avatar: 'https://www.seekpng.com/png/full/356-3562377_personal-user.png',
  follow: []
);

List<User> users = [
  User(
    id: 'u1',
    name: 'Jack',
    avatar: 'https://www.seekpng.com/png/full/356-3562377_personal-user.png',
    follow: []
  ),
  User(
    id: 'u2',
    name: 'Lisa',
    avatar:
        'https://w7.pngwing.com/pngs/516/431/png-transparent-female-profile-avatar-illustration-computer-icons-female-user-profile-female-girl-wife-woman-icon-miscellaneous-logo-monochrome.png',
    follow: []
  ),
  User(
    id: 'u3',
    name: 'Join',
    avatar:
        'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
    follow: []
  ),
  User(
    id: 'u4',
    name: 'David',
    avatar: 'https://manager.almadarisp.com/user/img/user.png',
    follow: []
  ),
];
User getUser({required String uid}) {
  return users.firstWhere((user) => user.id == uid);
}
