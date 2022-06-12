import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/pages/bottom_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: MyColor.background
      ),
      home: const BottomBar(),
    );
  }
}
