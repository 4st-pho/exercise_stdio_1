import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_5/pages/hidden_drawer.dart';
import 'package:stdio_week_5/provider/my_theme.dart';
import 'package:stdio_week_5/provider/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = context.watch<ThemeProvider>();
          return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeProvider.themeMode,
              darkTheme: MyTheme.darkTheme,
              theme: MyTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              home: const HiddenDrawer());
        });
  }
}
