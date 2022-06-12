import 'package:flutter/material.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/get_rating.dart';
import 'package:stdio_week_6/models/comment.dart';

class Review extends StatelessWidget {
  const Review({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    final user = comment.user;
    return Column(
      children: [
        const Divider(thickness: 1, height: 32),
        Row(children: [
          ClipOval(
          child: Image.network(user.avatar, width: 40, height: 40, fit: BoxFit.cover,),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: MyFont.blackTextSmall,
                ),
                Row(
                  children: getRating(comment.rating, height: 10),
                )
              ],
            ),
          ),
          const Spacer(),
          comment.like > 0
              ? Text(
                  '${comment.like}',
                  style: MyFont.greyLabel,
                )
              : const SizedBox(),
          const SizedBox(width: 8),
          Image.asset(
            'assets/icons/like.png',
            height: 20,
          )
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
              child: Text(
            comment.content,
            style: MyFont.blackTextSmall,
          ))
        ])
      ],
    );
  }
}
