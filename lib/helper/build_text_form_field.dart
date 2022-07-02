import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';

Widget buildTextFormFeild({
  required TextEditingController controller,
  String subtitle = '',
  required String title,
  required TextInputType type,
  bool showLabel = true,
  double spaceBetweenLabelAndTextfeild = 8,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      showLabel ? Text(title, style: MyFont.blackTitle) : const SizedBox(),
      SizedBox(height: spaceBetweenLabelAndTextfeild),
      TextFormField(
        style: const TextStyle(fontSize: 14, height: 1.47),
        minLines: 1,
        maxLines: type == TextInputType.multiline ? 10 : 1,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          isDense: true,
          border: MyDecoration.outlineInputBorder,
          hintText: showLabel ? 'Input for ${title.toLowerCase()}' : title,
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: MyFont.greySubtitle,
          enabledBorder: MyDecoration.outlineInputBorder,
          focusedBorder: MyDecoration.outlineInputBorder,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 5) {
            return 'Do not less than 5 characters.';
          }
          if (value.length > 150) {
            return 'Do not exceed 150 characters when entering.';
          }
          return null;
        },
      ),
      subtitle.isNotEmpty
          ? const SizedBox(height: 8)
          : const SizedBox(height: 0),
      subtitle.isNotEmpty
          ? Text(subtitle, style: MyFont.greySubtitle)
          : const SizedBox(),
    ],
  );
}
