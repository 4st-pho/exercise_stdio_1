import 'package:exercise_stdio_3/constants/font_style.dart';
import 'package:exercise_stdio_3/constants/my_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final String iconPath;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isSmall;
  const CustomButton(
      {this.content = '',
      this.iconPath = '',
      this.icon,
      this.isSmall = false,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: isSmall ? const Size(68, 33) : const Size(68, 56),
          primary: MyColor.lightGrey2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconPath == ''
              ? const SizedBox()
              : Image.asset(
                  iconPath,
                  height: isSmall ? 12 : 18,
                ),
          icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  size: isSmall ? 16 : 22,
                  color: Colors.blue,
                ),
          SizedBox(width: iconPath == '' && icon == null ? 0 : 5),
          Text(
            content,
            style:
                isSmall ? FontStyle.dartBlueTitle2 : FontStyle.dartBlueTitle1,
          )
        ],
      ),
    );
  }
}
