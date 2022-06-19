import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/bottom_appbar_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/pages/bookmark_page.dart';
import 'package:stdio_week_6/pages/discover_page.dart';
import 'package:stdio_week_6/pages/home_page.dart';
import 'package:stdio_week_6/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bottomBarBloc = MyBottomBarBloc();
  final List<Widget> _pages = const [
    HomePage(),
    DiscoverPage(),
    BookmarkPage(),
    ProfilePage()
  ];
  Widget bottomAppBarItem({
    required String iconName,
    required String iconNameActive,
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
                ? Image.asset(iconNameActive, height: 24)
                : Image.asset(iconName, height: 24),
            const SizedBox(height: 5),
            Text(
              lable,
              style: TextStyle(
                  color:
                      pageIndex == curentIndex ? Colors.blue.shade800 : color),
            ),
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    resetUser();
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
                          iconName: AssetsIcon.home,
                          iconNameActive: AssetsIcon.homeActive,
                          pageIndex: 0,
                          lable: 'Home',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: AssetsIcon.search,
                          iconNameActive: AssetsIcon.searchActive,
                          pageIndex: 1,
                          lable: 'Discover',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: AssetsIcon.book,
                          iconNameActive: AssetsIcon.bookActive,
                          pageIndex: 2,
                          lable: 'Bookmark',
                          curentIndex: data),
                      bottomAppBarItem(
                          iconName: AssetsIcon.user,
                          iconNameActive: AssetsIcon.homeActive,
                          pageIndex: 3,
                          lable: 'Profile',
                          curentIndex: data),
                    ]),
                  )));
        });
  }
}
