import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/pages/hidden_drawer.dart';
import 'package:stdio_week_5/pages/widgets/add_story_textfield.dart';
import 'package:stdio_week_5/pages/widgets/slider_add.dart';
import 'package:stdio_week_5/helper/story_property.dart';
import 'package:stdio_week_5/provider/stories.dart';
import 'package:stdio_week_5/widgets/custom_button.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({Key? key}) : super(key: key);

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  bool isNextScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue]),
          ),
          child: SafeArea(
            child: isNextScreen ? scrren2() : scrren1(),
          )),
    );
  }

  Widget scrren1() {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(seconds: 1),
      child: Column(children: [
        const Text(
          'How do you feel?',
          style: MyFont.primaryWhite,
        ),
        const Spacer(),
        const SliderAdd(),
        const Spacer(),
        CustomButton(
            onPress: () {
              setState(() {
                isNextScreen = true;
              });
            },
            text: 'Continue'),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }

  Widget scrren2() {
    return ChangeNotifierProvider(
        create: (context) => Stories(),
        builder: (context, _) {

          final stories = context.read<Stories>();
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const Spacer(),
              AddStoryTextField(title: storyProperty['title'], content: storyProperty['content']),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPress: () {
                      setState(() {
                        isNextScreen = false;
                      });
                    },
                    text: 'Pre',
                  ),
                  CustomButton(
                      onPress: () async {
                        final msg = await stories.addStory(
                          title: storyProperty['title'],
                          content: storyProperty['content'],
                          feeling: storyProperty['feeling'],
                        );
                        if (msg == 'ok') {
                          truncateStoryProperty();
                          Navigator.of(context).pop(msg);
                        }
                        else{
                          truncateStoryProperty();
                          Navigator.of(context).pop(msg);
                        }
                      },
                      text: 'Add')
                ],
              )
            ]),
          );
        });
  }
}
