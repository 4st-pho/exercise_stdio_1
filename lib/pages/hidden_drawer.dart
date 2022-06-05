import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/pages/home_page.dart';
import 'package:stdio_week_5/pages/setting_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Diary',
          baseStyle: MyFont.whiteBold,
          selectedStyle: const TextStyle(),
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Setting',
              baseStyle: MyFont.whiteBold,
              selectedStyle: const TextStyle()),
          const SettingPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade600,
      screens: _pages,
      initPositionSelected: 0,
      elevationAppBar: 0,
      slidePercent: 60,
      contentCornerRadius: 40,
    );
  }
}
