import 'package:exercise_stdio_3/constants/font_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EventInfo extends StatelessWidget {
  final DateTime time;
  final String name;
  final String description;
  final double spaceBetween;
  const EventInfo(
      {required this.time,
      required this.name,
      required this.description,
      this.spaceBetween = 0,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat("dd MMM yyyy,").add_jm().format(time),
          style: FontStyle.redTitle,
        ),
        SizedBox(
          height: 5 + spaceBetween,
        ),
        Text(
          name,
          style: FontStyle.dartBlue,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: FontStyle.greyTitle,
        ),
      ],
    );
  }
}
