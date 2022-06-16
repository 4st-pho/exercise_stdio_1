import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/add_hotel_bloc.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';
import 'package:stdio_week_6/widgets/custom_outline_button.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({Key? key}) : super(key: key);

  @override
  State<AddHotelPage> createState() => _AddHotelPageState();
}

class _AddHotelPageState extends State<AddHotelPage> {
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController descriptionController;
  final _addHotelBloc = AddHotelBloc();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    addressController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    _addHotelBloc.dispose();
  }

  Widget buildTextFeild(
      {required TextEditingController controller,
      String subtitle = '',
      required String title,
      required TextInputType type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: MyFont.blackTitle),
        const SizedBox(height: 10),
        TextField(
          minLines: 1,
          maxLines: type == TextInputType.multiline ? 10 : 1,
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            border: MyDecoration.outlineInputBorder,
            hintText: 'input for $title',
            fillColor: Colors.transparent,
            filled: true,
            hintStyle: MyFont.greyLabel,
            enabledBorder: MyDecoration.outlineInputBorder,
            focusedBorder: MyDecoration.outlineInputBorder,
          ),
        ),
        subtitle == '' ? const SizedBox(height: 0) : const SizedBox(height: 8),
        Text(subtitle, style: MyFont.greyLabel),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/arow_black.png', height: 24,),onPressed: (){Navigator.of(context).pop();}),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Add hotel', style: MyFont.blackHeading),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextFeild(
                    controller: nameController,
                    subtitle: 'Do not exceed 40 characters when entering.',
                    title: 'Hotel name',
                    type: TextInputType.text),
                buildTextFeild(
                    controller: addressController,
                    title: 'Address',
                    type: TextInputType.text),
                buildTextFeild(
                    controller: descriptionController,
                    title: 'Desciption',
                    type: TextInputType.multiline),
                const Text('Hotel image', style: MyFont.blackTitle),
                const SizedBox(height: 10),
                StreamBuilder<File?>(
                  stream: _addHotelBloc.stream,
                  initialData: null,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final image = snapshot.data;
                    return image == null
                        ? DottedBorder(
                            color: MyColor.grey,
                            strokeWidth: 1,
                            dashPattern: const [8, 4],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            child: InkWell(
                              onTap: () async {
                                await _addHotelBloc.getImage();
                              },
                              child: SizedBox(
                                width: 139,
                                height: 139,
                                child: Center(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/gallery.png',
                                        height: 24),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Add image',
                                      style: MyFont.greySubtitle.copyWith(
                                          decoration: TextDecoration.underline),
                                    )
                                  ],
                                )),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              await _addHotelBloc.getImage();
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: Image.file(
                                image,
                                height: 162,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                  },
                ),
                const SizedBox(height: 20,)
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                CustomOutlineButton(text: 'Cancel', onPress: () {}),
                const Spacer(),
                CustomButton(
                  text: 'Done',
                  onPress: () {},
                  infiniti: false,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
