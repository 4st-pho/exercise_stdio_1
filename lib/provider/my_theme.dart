import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(34, 42, 106, 1),
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isDarkModeOn) {
    themeMode = isDarkModeOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
