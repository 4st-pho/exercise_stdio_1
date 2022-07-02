import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';

Widget buildPasswordTextFormField({
  required TextEditingController controller,
  required String title,
  required VoidCallback onToggleState,
  required bool isPasswordVisible,
  required String? Function(String?) onValidate,
}) {
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
