import 'package:exercise_stdio_3/models/event.dart';
import 'package:exercise_stdio_3/models/user.dart';

final user = User(
    id: 01,
    email: "hello@gmail.com",
    avatar:
        "https://www.vhv.rs/dpng/d/556-5566192_mystery-man-avatar-new-taipei-city-hd-png.png",
    name: "user ",
    lastName: " user",
    isFollowed: false);

List<Event> events = [
  Event(
      id: 1,
      name: "Hello",
      pathImage:
          "http://tochucsukienemasaigon.com/upload/news/2018/09/18/hoat-dong-activation-va-event-co-gi-khac-nhau-20180920183856-510925.jpg",
      locationName: "Hue",
      description: "Event Hue",
      timeStart: DateTime.now(),
      timeEnd: DateTime(2022, 5, 5),
      organiser: user,
      price: "20.05",
      link: "google.com",
      isLike: false,
      isGoing: false),
  Event(
      id: 2,
      name: "Hello",
      pathImage:
          "https://blog.topcv.vn/wp-content/uploads/2021/07/sk2uEvents_Page_Header_2903ed9c-40c1-4f6c-9a69-70bb8415295b.jpg",
      locationName: "Hue",
      description: "Event Hue",
      timeStart: DateTime.now(),
      timeEnd: DateTime(2022, 5, 5),
      organiser: user,
      price: "20.05",
      link: "google.com",
      isLike: true,
      isGoing: false),
  Event(
      id: 3,
      name: "Hello",
      pathImage:
          "https://cdn.brvn.vn/topics/1280px/2020/23552_23552_xuhuongEvent2020-Covid-19_Ava_2.jpg",
      locationName: "Hue",
      description: "Event Hue",
      timeStart: DateTime.now(),
      timeEnd: DateTime(2022, 5, 5),
      organiser: user,
      price: "20.05",
      link: "google.com",
      isLike: false,
      isGoing: false),
  Event(
      id: 3,
      name: "Hello",
      pathImage:
          "https://crmviet.vn/wp-content/uploads/2019/05/event-marketing.jpg",
      locationName: "Hue",
      description: "Event Hue",
      timeStart: DateTime.now(),
      timeEnd: DateTime(2022, 5, 5),
      organiser: user,
      price: "20.05",
      link: "google.com",
      isLike: false,
      isGoing: false),
];
