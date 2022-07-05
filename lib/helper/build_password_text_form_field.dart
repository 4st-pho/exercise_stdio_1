import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';

class BuildPasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final VoidCallback onToggleState;
  final bool isPasswordVisible;
  final String? Function(String?) onValidate;

  const BuildPasswordTextFormField(
      {Key? key,
      required this.controller,
      required this.title,
      required this.onToggleState,
      required this.isPasswordVisible,
      required this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !isPasswordVisible,
        style: const TextStyle(fontSize: 14, height: 1.47),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Image.asset(AssetsIcon.eye, height: 24)
                : Image.asset(AssetsIcon.eyeSlash, height: 24),
            onPressed: onToggleState,
          ),
          isDense: true,
          border: MyDecoration.outlineInputBorder,
          hintText: title,
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: MyFont.greySubtitle,
          enabledBorder: MyDecoration.outlineInputBorder,
          focusedBorder: MyDecoration.outlineInputBorder,
        ),
        validator: onValidate);
  }
}
