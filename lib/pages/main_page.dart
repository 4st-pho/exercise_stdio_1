import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/bottom_appbar_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_color.dart';
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
  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required int index,
      required int curentIndex,
      required String icon,
      required String activeIcon,
      required String label}) {
    return index == curentIndex
        ? BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Image.asset(activeIcon, height: 24),
            ),
            label: label,
          )
        : BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Image.asset(icon, height: 24),
            ),
            label: label,
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
          final currentIndex = snapshot.data!;
          return Scaffold(
              body: _pages[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: MyColor.background,
                currentIndex: currentIndex,
                selectedItemColor: MyColor.blue,
                unselectedItemColor: MyColor.grey,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (pageIndex) {
                  _bottomBarBloc.selectPage(pageIndex);
                },
                items: [
                  buildBottomNavigationBarItem(
                      index: 0,
                      curentIndex: currentIndex,
                      icon: AssetsIcon.home,
                      activeIcon: AssetsIcon.homeActive,
                      label: 'Home'),
                  buildBottomNavigationBarItem(
                      index: 1,
                      curentIndex: currentIndex,
                      icon: AssetsIcon.search,
                      activeIcon: AssetsIcon.searchActive,
                      label: 'Discover'),
                  buildBottomNavigationBarItem(
                      index: 2,
                      curentIndex: currentIndex,
                      icon: AssetsIcon.book,
                      activeIcon: AssetsIcon.bookActive,
                      label: 'Bookmark'),
                  buildBottomNavigationBarItem(
                      index: 3,
                      curentIndex: currentIndex,
                      icon: AssetsIcon.user,
                      activeIcon: AssetsIcon.userActive,
                      label: 'Profile'),
                ],
              ));
        });
  }
}
