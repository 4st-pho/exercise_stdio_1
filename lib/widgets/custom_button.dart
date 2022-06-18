import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_color.dart';

class CustomButton extends StatelessWidget {
  final bool infiniti;
  final String text;
  final Color color;
  final VoidCallback? onPress;
  const CustomButton(
      {this.infiniti = true,
      this.color = MyColor.blue,
      required this.text,
      Key? key,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            minimumSize: infiniti
                ? const Size(double.infinity, 53)
                : const Size(233, 53),
            elevation: 0,
            onPrimary: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        onPressed: onPress,
        child: Center(child: Text(text)));
  }
}
