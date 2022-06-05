import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stdio_week_5/constants/my_color.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/helper/status.dart';
import 'package:stdio_week_5/model/story.dart';
import 'package:stdio_week_5/pages/story_detail_page.dart';
import 'package:stdio_week_5/provider/my_theme.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key,}) : super(key: key);
  Widget _time(Story story) {
    final saveTime = story.time;
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 50, minWidth: 70),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromARGB(190, 100, 162, 255),
                Color.fromARGB(255, 123, 106, 245),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(children: [
            Text(
              '${saveTime.day}',
              style: MyFont.secondaryBlack,
            ),
            Text(
              DateFormat('MMM').format(saveTime),
              style: MyFont.secondaryBlackActive,
            )
          ]),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEEE').format(
                saveTime,
              ),
              style: MyFont.secondaryBlackActive,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              '${saveTime.year}',
              style: MyFont.secondaryBlack,
            )
          ],
        )
      ],
    );
  }

  Widget _status(Story story) {
    final double status = story.feeling;
    final DateTime saveTime = story.time;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color.fromARGB(190, 100, 162, 255),
            Color.fromARGB(255, 123, 106, 245),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              getStatus(status)[0],
              height: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    getStatus(status)[1],
                    style: MyFont.secondaryBlackBig,
                  ),
                  Text(
                    DateFormat().add_Hm().format(saveTime),
                    style: MyFont.secondaryBlackBig,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final story = context.watch<Story>();
    return Card(
      elevation: 2,
      color: themeProvider.isDarkMode
          ? MyColor.transparentDark
          : MyColor.transparentLight,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _time(story),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoryDetailPage(story: story),
                  ));
                },
                child: _status(story)),
          ],
        ),
      ),
    );
  }
}
