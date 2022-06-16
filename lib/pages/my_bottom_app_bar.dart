import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/bottom_appbar_bloc.dart';
import 'package:stdio_week_6/pages/bookmark_page.dart';
import 'package:stdio_week_6/pages/discover_page.dart';
import 'package:stdio_week_6/pages/home_page.dart';
import 'package:stdio_week_6/pages/profile_page.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  final _bottomBarBloc = MyBottomBarBloc();
  final List<Widget> _pages = const [
    HomePage(),
    DiscoverPage(),
    BookmarkPage(),
    ProfilePage()
  ];
  Widget bottomAppBarItem({
    required String iconName,
    required String lable,
    required int pageIndex,
    required int curentIndex,
    Color color = Colors.grey,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _bottomBarBloc.selectPage(pageIndex);
        },
        child: Column(
          children: [
            const SizedBox(height: 10),
            pageIndex == curentIndex
                ? Image.asset('assets/icons/${iconName}_active.png', height: 24)
                : Image.asset('assets/icons/$iconName.png', height: 24),
            const SizedBox(height: 5),
            Text(
              lable,
              style: TextStyle(
                  color:
                      pageIndex == curentIndex ? Colors.blue.shade800 : color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBarBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _bottomBarBloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data!;
          return Scaffold(
              body: _pages[data],
              bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  child: SizedBox(
                    height: 60,
                    child: Row(children: [
                      bottomAppBarItem(
                          iconName: 'home',
                          pageIndex: 0,
                          lable: 'Home',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: 'search',
                          pageIndex: 1,
                          lable: 'Discover',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: 'book',
                          pageIndex: 2,
                          lable: 'Bookmark',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: 'user',
                          pageIndex: 3,
                          lable: 'Profile',
                          curentIndex: data),
                    ]),
                  )));
        });
  }
}
