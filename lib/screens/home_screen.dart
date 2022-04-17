import 'package:exercise_stdio_1/utils/colors.dart';
import 'package:exercise_stdio_1/widgets/favorite_page.dart';
import 'package:exercise_stdio_1/widgets/place_page.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final List<Widget> _page = const [
    PlacePage(),
    FavoritePage(),
  ];
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: const Text(
            'Restaurant awesome',
            style: TextStyle(color: MyColor.primary),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: _page.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        currentIndex: _pageIndex,
        onTap: _selectPage,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        backgroundColor: Colors.transparent,
        unselectedItemColor: MyColor.darkGray,
        
      ),
      backgroundColor: MyColor.bg,
    );
  }
}
