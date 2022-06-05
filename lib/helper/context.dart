import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String content,
    bool error = false}) {
  final snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
      ),
      backgroundColor: error ? Colors.red : Colors.green);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
