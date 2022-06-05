import 'package:flutter/material.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/helper/status.dart';
import 'package:stdio_week_5/helper/story_property.dart';

late double initValue;

// ignore: must_be_immutable
class SilderEdit extends StatefulWidget {
  double init;
  SilderEdit({Key? key, this.init = 3}) : super(key: key);

  @override
  State<SilderEdit> createState() => _StatusSliderStateEdit();
}

class _StatusSliderStateEdit extends State<SilderEdit> {
  @override
  void initState() {
    super.initState();
    initValue = widget.init;
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
            storyProperty[2] = value;
            setState(() {
              initValue = value;
            });
          },
        ),
      ],
    );
  }
}
