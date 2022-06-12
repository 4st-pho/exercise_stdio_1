import 'package:flutter/material.dart';
import 'package:stdio_week_6/pages/bookmark_page.dart';
import 'package:stdio_week_6/pages/discover_page.dart';
import 'package:stdio_week_6/pages/home_page.dart';
import 'package:stdio_week_6/pages/profile_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    DiscoverPage(),
    BookmarkPage(),
    ProfilePage()
  ];
  Widget bottomAppBarItem({
    required String icon,
    required String lable,
    required int pageIndex,
    Color color = Colors.grey,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _pageIndex = pageIndex;
          });
        },
        child: Column(
          children: [
            const SizedBox(height: 10),
            pageIndex == _pageIndex
                ? Image.asset('assets/icons/${icon}_active.png', height: 24)
                : Image.asset('assets/icons/$icon.png', height: 24),
            const SizedBox(height: 5),
            Text(
              lable,
              style: TextStyle(
                  color: pageIndex == _pageIndex ? Colors.blue.shade800 : color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_pageIndex],
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
            child: SizedBox(
          height: 60,
          child: Row(children: [
            bottomAppBarItem(icon: 'home', pageIndex: 0, lable: 'Home'),
            bottomAppBarItem(icon: 'search', pageIndex: 1, lable: 'Discover'),
            bottomAppBarItem(icon: 'book', pageIndex: 2, lable: 'Bookmark'),
            bottomAppBarItem(icon: 'user', pageIndex: 3, lable: 'Profile'),
          ]),
        )));
  }
}
