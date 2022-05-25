import 'package:exercise_stdio_3/models/event.dart';
import 'package:exercise_stdio_3/screens/event_detail_screen.dart';
import 'package:exercise_stdio_3/constants/my_color.dart';
import 'package:exercise_stdio_3/constants/font_style.dart';
import 'package:exercise_stdio_3/screens/pages/widgets/widgets/event_info.dart';
import 'package:exercise_stdio_3/widgets/image_content.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final Event event;
  const EventItem({required this.event, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _organiser() => Row(
          children: [
            Image.network(
              event.organiser.avatar,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: FontStyle.dartBlue,
                  ),
                  Text(
                    event.organiser.lastName,
                    style: FontStyle.greyTitle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            event.isLike
                ? Image.asset("assets/icons/i_favorite_active.png")
                : Image.asset("assets/icons/i_favorite.png"),
          ],
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EventDetailScreen(
                          event: event,
                        )));
              }),
              child: ImageContent(
                  pathImage: event.pathImage,
                  backgroundColor: MyColor.primaryRed,
                  font: FontStyle.primaryWhite,
                  text: event.price),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventInfo(
                      time: event.timeStart,
                      name: event.name,
                      description: event.description),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: _organiser(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
