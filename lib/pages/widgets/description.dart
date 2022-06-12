import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_font.dart';

class Description extends StatefulWidget {
  const Description({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  late String firstHalf;
  late String secondHalf;
  bool isShow = false;
  @override
  void initState() {
    super.initState();
    int textLength = widget.text.length;
    if (textLength > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, textLength - 1);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: MyFont.blueHeading),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: secondHalf == ''
                  ? Text(widget.text, style: MyFont.blackText)
                  : isShow
                      ? Text(widget.text, style: MyFont.blackText)
                      : Wrap(
                          children: [
                            Text('$firstHalf... ', style: MyFont.blackText),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              },
                              child: Text(
                                'read more',
                                style: MyFont.blackText.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
            )
          ],
        )
      ],
    );
  }
}
