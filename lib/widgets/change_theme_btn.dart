import 'package:flutter/material.dart';
import 'package:stdio_week_5/provider/my_theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeBtn extends StatelessWidget {
  const ChangeThemeBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final theme = context.read<ThemeProvider>();
        theme.toggleTheme(value);
      },
    );
  }
}
