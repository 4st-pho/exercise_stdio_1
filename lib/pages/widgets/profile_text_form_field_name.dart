import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';


class ProfileTextFormFeildName extends StatelessWidget {
  const ProfileTextFormFeildName({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: nameController,
      style: const TextStyle(
        color: MyColor.primaryGrey,
        fontSize: 20,
      ),
      decoration: const InputDecoration(
        enabledBorder:
            MyDecoration.underlineInputBorder,
        focusedBorder:
            MyDecoration.underlineInputBorder,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 2) {
          return 'Do not less than 2 characters.';
        }
        if (value.length > 20) {
          return 'Do not exceed 20 characters when entering.';
        }
        return null;
      },
    );
  }
}