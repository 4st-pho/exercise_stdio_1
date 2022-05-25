import 'package:exercise_stdio_3/constants/font_style.dart';
import 'package:exercise_stdio_3/dummy_data.dart';
import 'package:exercise_stdio_3/screens/pages/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'What\'s on',
                style: FontStyle.dartBlue.copyWith(fontSize: 27),
              ),
            )
          : EventItem(event: events[index - 1]),
      itemCount: events.length + 1,
    );
  }
}
