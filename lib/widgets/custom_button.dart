import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stdio_week_6/constants/my_color.dart';

class CustomButton extends StatelessWidget {
  final bool infiniti;
  final String text;
  const CustomButton({this.infiniti = true, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: MyColor.blue,
          borderRadius: BorderRadius.circular(4),
        ),
        width: infiniti ? double.infinity : 223,
        height: 53,
        child: Center(child: Text(text)));
  }
}
