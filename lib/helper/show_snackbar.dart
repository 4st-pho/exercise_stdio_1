import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String content,
    bool error = false,
    int milisecond = 1200 }) {
  final snackBar = SnackBar(
      duration: Duration(milliseconds: milisecond),
      content: Text(content.trim(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          )),
      backgroundColor: error ? Colors.red : Colors.green);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
