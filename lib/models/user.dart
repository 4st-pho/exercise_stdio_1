class User {
  const User({
    required this.id,
    required this.name,
    required this.avatar,
  });
  final String id;
  final String name;
  final String avatar;
}


const user1 = User(
  id: 'u1',
  name: 'Jack',
  avatar:
      'https://www.seekpng.com/png/full/356-3562377_personal-user.png',
);
const user2 = User(
  id: 'u2',
  name: 'Lisa',
  avatar:
      'https://w7.pngwing.com/pngs/516/431/png-transparent-female-profile-avatar-illustration-computer-icons-female-user-profile-female-girl-wife-woman-icon-miscellaneous-logo-monochrome.png',
);
const user3 = User(
  id: 'u3',
  name: 'Join',
  avatar:
      'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
);
const user4 = User(
  id: 'u4',
  name: 'David',
  avatar: 'https://manager.almadarisp.com/user/img/user.png',
);

