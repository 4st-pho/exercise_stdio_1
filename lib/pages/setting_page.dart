import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_5/provider/my_theme.dart';
import 'package:stdio_week_5/widgets/change_theme_btn.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Container(
      width: double.infinity,
      color: theme.isDarkMode ? const Color.fromRGBO(34, 42, 106, 1) : Colors.white54,
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          ListTile(title: Text('Dark mode'), trailing: ChangeThemeBtn()),
        ]
      ),
    );
  }
}
