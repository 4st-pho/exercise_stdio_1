import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/show_snackbar.dart';
import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/pages/add_hotel_page.dart';
import 'package:stdio_week_6/widgets/image_button.dart';

class HomeBar extends StatelessWidget {
  final BuildContext context;
  const HomeBar({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Hello , ${currenUser.name}",
                  style: MyFont.blackHeading,
                  overflow: TextOverflow.ellipsis,
                ),
                RichText(
                    text: const TextSpan(style: MyFont.blackHeading, children: [
                  TextSpan(text: 'Explore '),
                  TextSpan(text: 'New Hotel', style: MyFont.blueHeading),
                ])),
              ],
            ),
          ),
          ImageButton(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => const AddHotelPage()))
                    .then((value) {
                  if (value != null) {
                    showSnackBar(context: context, content: value.toString());
                  }
                });
              },
              assetsIcon: AssetsIcon.add)
        ],
      ),
    );
  }
}
