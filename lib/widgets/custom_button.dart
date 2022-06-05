import 'package:flutter/material.dart';
import 'package:stdio_week_5/constants/my_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPress, required this.text})
      : super(key: key);
  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size(130, 45),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(color: MyColor.deepPurple, fontSize: 20),
      ),
    );
  }
}
