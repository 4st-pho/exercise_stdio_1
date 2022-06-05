import 'package:flutter/material.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/helper/status.dart';
import 'package:stdio_week_5/helper/story_property.dart';

double initValue = 3;

// ignore: must_be_immutable
class SliderAdd extends StatefulWidget {
  const SliderAdd({Key? key}) : super(key: key);

  @override
  State<SliderAdd> createState() => _StatusSliderStateEdit();
}

class _StatusSliderStateEdit extends State<SliderAdd> {
  @override
  void initState() {
    super.initState();
    initValue = storyProperty['feeling'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          getStatus(initValue)[0],
          height: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          getStatus(initValue)[1],
          style: MyFont.secondaryBlackBig,
        ),
        const SizedBox(
          height: 30,
        ),
        Slider(
          value: initValue,
          min: 1,
          max: 6,
          divisions: 5,
          // label: _status.round().toString(),
          onChanged: (double value) {
            storyProperty['feeling'] = value;
            setState(() {
              initValue = value;
            });
          },
        ),
      ],
    );
  }
}
