import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:stdio_week_5/constants/my_color.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/constants/my_input_decoration.dart';
import 'package:stdio_week_5/helper/status.dart';
import 'package:stdio_week_5/helper/story_property.dart';
import 'package:stdio_week_5/model/story.dart';
import 'package:stdio_week_5/pages/widgets/slider_edit.dart';
import 'package:stdio_week_5/provider/stories.dart';
import 'package:stdio_week_5/widgets/custom_icon_button.dart';

class StoryDetailPage extends StatefulWidget {
  final Story story;
  const StoryDetailPage({Key? key, required this.story}) : super(key: key);

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  bool isEdit = false;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.story.title;
    contentController.text = widget.story.content;
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stories = context.read<Stories>();
    final storyC = widget.story;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
            decoration: const BoxDecoration(color: MyColor.lightBlue),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                isEdit
                    ? SilderEdit(
                        init: storyC.feeling,
                      )
                    : Column(
                        children: [
                          Image.asset(
                            getStatus(storyC.feeling)[0],
                            height: 60,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            getStatus(storyC.feeling)[1],
                            style: MyFont.secondaryBlackBig,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy ')
                                .add_Hm()
                                .format(DateTime.now()),
                            style: MyFont.secondaryBlack,
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    readOnly: !isEdit,
                    style: const TextStyle(color: Colors.white),
                    decoration: MyInputDecoration.style1),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: contentController,
                  readOnly: !isEdit,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  decoration: MyInputDecoration.style1.copyWith(
                    hintText: 'Your thoughts',
                  ),
                  minLines: 4,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isEdit
          ? CustomIconButton(
              onPress: () async {
                setState(() {
                  isEdit = false;
                });
                String msg = await stories.updateStory(Story(
                    id: storyC.id,
                    title: titleController.text,
                    content: contentController.text,
                    feeling: storyProperty['feeling'],
                    time: storyC.time));
              },
              icon: Icons.done,
              color: Colors.greenAccent,
            )
          : CustomIconButton(
              onPress: () {
                setState(() {
                  isEdit = true;
                });
              },
              icon: Icons.edit,
              color: Colors.deepOrangeAccent,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
