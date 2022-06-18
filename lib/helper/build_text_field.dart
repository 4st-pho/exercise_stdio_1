import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';

Widget buildTextFeild(
    {required TextEditingController controller,
    String subtitle = '',
    required String title,
    required TextInputType type}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: MyFont.blackTitle),
      const SizedBox(height: 10),
      TextField(
        minLines: 1,
        maxLines: type == TextInputType.multiline ? 10 : 1,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: MyDecoration.outlineInputBorder,
          hintText: 'input for $title',
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: MyFont.greyLabel,
          enabledBorder: MyDecoration.outlineInputBorder,
          focusedBorder: MyDecoration.outlineInputBorder,
        ),
      ),
      subtitle == '' ? const SizedBox(height: 0) : const SizedBox(height: 8),
      Text(subtitle, style: MyFont.greyLabel),
      const SizedBox(height: 16),
    ],
  );
}