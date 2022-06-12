import 'package:flutter/material.dart';
import 'package:stdio_week_6/models/comment.dart';
import 'package:stdio_week_6/pages/widgets/review.dart';

class BottomReview extends StatelessWidget {
  const BottomReview({Key? key, required this.reviews}) : super(key: key);
  final List<Comment> reviews;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Review(comment: reviews[index]),
        );
      },
    );
  }
}
