import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_5/pages/widgets/story_builder.dart';
import 'package:stdio_week_5/provider/stories.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stories = context.read<Stories>();
    return FutureBuilder(
      future: stories.fetchAndSetStories(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        } else {
          if (snap.error != null) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const StoryBuilder();
          }
        }
      },
    );
  }
}
