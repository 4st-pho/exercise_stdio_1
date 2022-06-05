import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stdio_week_5/constants/my_color.dart';
import 'package:stdio_week_5/constants/my_font.dart';
import 'package:stdio_week_5/helper/story_property.dart';
class AddStoryTextField extends StatefulWidget {
  const AddStoryTextField({Key? key, required this.title, required this.content}) : super(key: key);
  final String title;
  final String content;
  @override
  State<AddStoryTextField> createState() => _AddStoryTextFieldState();
}

class _AddStoryTextFieldState extends State<AddStoryTextField> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    contentController.text = widget.content;
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: MyColor.lightBlue,
        width: 0.0,
      ),
    );

    return Column(
      children: [
        Text(
          DateFormat('dd/MM/yyyy ').add_Hm().format(DateTime.now()),
          style: MyFont.primaryWhite,
        ),
        const SizedBox(
          height: 100,
        ),
        TextField(
          controller: titleController,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            storyProperty['title'] = value;
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Title',
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white30,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: contentController,
          onChanged: (value) {
            storyProperty['content'] = value;
          },
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Your thoughts',
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white30,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
          ),
          minLines: 4,
          maxLines: 10,
        ),
      ],
    );
  }
}
