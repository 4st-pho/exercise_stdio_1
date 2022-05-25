import 'package:exercise_stdio_3/screens/pages/chat_page.dart';
import 'package:exercise_stdio_3/screens/pages/favorite_page.dart';
import 'package:exercise_stdio_3/screens/pages/friend_page.dart';
import 'package:exercise_stdio_3/screens/pages/home_page.dart';
import 'package:exercise_stdio_3/screens/pages/timetable_page.dart';
import 'package:exercise_stdio_3/constants/my_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TimetablePage(),
    const FavoritePage(),
    const FriendPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.background,
        elevation: 0,
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Image.asset("assets/icons/i_menu.png"),
          ),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Image.asset("assets/icons/i_event.png"),
            ),
          ),
        ],
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            setState(() {
              _pageIndex = idx;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          selectedItemColor: MyColor.darkBlue,
          unselectedItemColor: MyColor.lightGrey1,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset("assets/icons/i_home.png"),
                ),
                label: "What's on"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset("assets/icons/i_timetable.png"),
                ),
                label: "Timeyable"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: _pageIndex == 2
                      ? Image.asset("assets/icons/i_favorites_active.png")
                      : Image.asset("assets/icons/i_favorites.png"),
                ),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: _pageIndex == 3
                      ? Image.asset("assets/icons/i_friends_active.png")
                      : Image.asset("assets/icons/i_friends.png"),
                ),
                label: "Friends"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: _pageIndex == 4
                      ? Image.asset("assets/icons/i_chat_active.png")
                      : Image.asset("assets/icons/i_chat.png"),
                ),
                label: "Chats"),
          ]),
    );
  }
}
