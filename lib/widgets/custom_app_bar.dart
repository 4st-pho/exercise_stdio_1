import 'package:flutter/material.dart';

// ignore: prefer_function_declarations_over_variables
final customAppBar = ({
  required String leadingIcon,
  required String actionIcon,
  required VoidCallback ontap1,
  required String title,
  required VoidCallback ontap2,
}) =>
    AppBar(
      leadingWidth: 80,
      automaticallyImplyLeading: true,
      leading: InkWell(
        onTap: ontap1,
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
              child: Image.asset(
            leadingIcon,
            height: 20,
          )),
        ),
      ),
      actions: [
        InkWell(
          onTap: ontap2,
          child: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Center(
                child: Image.asset(
              actionIcon,
              height: 20,
            )),
          ),
        ),
      ],
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
