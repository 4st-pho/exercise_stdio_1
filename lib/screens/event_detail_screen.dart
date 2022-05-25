import 'package:exercise_stdio_3/constants/constants.dart';
import 'package:exercise_stdio_3/constants/my_color.dart';
import 'package:exercise_stdio_3/models/event.dart';
import 'package:exercise_stdio_3/constants/font_style.dart';
import 'package:exercise_stdio_3/screens/pages/widgets/widgets/event_info.dart';
import 'package:exercise_stdio_3/widgets/custom_app_bar.dart';
import 'package:exercise_stdio_3/widgets/custom_button.dart';
import 'package:exercise_stdio_3/widgets/image_content.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({required this.event, Key? key}) : super(key: key);
  Widget _organiser() => Row(
        children: [
          Image.network(
            event.organiser.avatar,
            height: 40,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.organiser.name,
                  style: FontStyle.dartBlue,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          CustomButton(
            onPressed: () {},
            icon: Icons.add,
            content: 'Follow',
            isSmall: true,
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          leadingIcon: "assets/icons/i_remove.png",
          actionIcon: 'assets/icons/i_event.png',
          ontap1: () {
            Navigator.of(context).pop();
          },
          ontap2: () {},
          title: '',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageContent(
                      pathImage: event.pathImage,
                      backgroundColor: Colors.white,
                      font: FontStyle.blackTitle,
                      text: event.price,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 24, right: 24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EventInfo(
                              time: event.timeEnd,
                              name: event.name,
                              description: event.locationName,
                              spaceBetween: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  icon:
                                      event.isGoing ? Icons.done : Icons.close,
                                  onPressed: () {},
                                  content: event.isGoing
                                      ? 'I\'m going'
                                      : 'I\'m not going',
                                ),
                                CustomButton(
                                  icon: event.isLike
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  onPressed: () {},
                                ),
                                CustomButton(
                                    iconPath:
                                        Constants.iconPath + 'i_share.png',
                                    onPressed: () {}),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/i_people.png',
                                  height: 18,
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  '42 people are going including ',
                                  style: FontStyle.greySubtitle,
                                ),
                                const Text(
                                  '2 friends',
                                  style: FontStyle.blueSubtitle,
                                ),
                              ],
                            ),
                            const Divider(
                              color: MyColor.stroke,
                              height: 40,
                              thickness: 2,
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'hello there, hello there, hello there, hello there, hello there, hello there, hello there, hello there, hello there, hello there, ',
                                    style: FontStyle.greyTitle,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Show more'),
                            ),
                            const SizedBox(height: 15),
                            _organiser(),
                            const Divider(
                              color: MyColor.stroke,
                              height: 40,
                              thickness: 2,
                            ),
                            const Text(
                              'Friends attending',
                              style: FontStyle.greySubtitle,
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              child: Container(
                  height: 64,
                  decoration: const BoxDecoration(color: Colors.blue),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'RSVP',
                      style: FontStyle.primaryWhite.copyWith(fontSize: 22),
                    ),
                  )),
            )
          ],
        ));
  }
}
