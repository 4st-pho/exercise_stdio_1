import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_5/model/story.dart';
import 'package:stdio_week_5/provider/stories.dart';
import 'package:stdio_week_5/widgets/story_item.dart';

class StoryBuilder extends StatelessWidget {
  const StoryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stories = context.read<Stories>();
    final allStories = stories.getStories;
    return ListView.builder(
        itemCount: allStories.length,
        itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(7),
              child: Dismissible(
                  key: Key(allStories[index].id),
                  onDismissed: (_) async {
                    final msg = await stories.deleteStory(allStories[index].id);
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 30),
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  child: ChangeNotifierProvider.value(
                      value: allStories[index], child: const StoryItem())),
            ));
  }
}
