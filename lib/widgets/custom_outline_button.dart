import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_color.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {Key? key,
      this.infiniti = false,
      required this.text,
      required this.onPress})
      : super(key: key);
  final bool infiniti;
  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(111, 53),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          side: const BorderSide(color: MyColor.grey)),
      onPressed: onPress,
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
