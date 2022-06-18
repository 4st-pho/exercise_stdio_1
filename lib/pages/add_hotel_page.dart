import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/change_image_bloc.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/constants/collection_path.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/build_text_field.dart';
import 'package:stdio_week_6/pages/widgets/dotted_image.dart';
import 'package:stdio_week_6/pages/widgets/image_border.dart';
import 'package:stdio_week_6/services/cloud_firestore/hotel_firestore.dart';
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
  File? file;
  final _addHotelBloc = ChangeImageBloc();
  final _loadingBloc = LoadingBloc();

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
    _loadingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/icons/arow_black.png',
              height: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
                    final imageFile = snapshot.data;
                    file = imageFile;
                    return imageFile == null
                        ? DottedImage(onPressed: () async {
                            await _addHotelBloc.getImage();
                          })
                        : InkWell(
                            onTap: () async {
                              await _addHotelBloc.getImage();
                            },
                            child: ImageBorder(imageFile: imageFile));
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                CustomOutlineButton(text: 'Cancel', onPress: () {}),
                const Spacer(),
                StreamBuilder<bool>(
                    stream: _loadingBloc.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final loading = snapshot.data!;
                      return CustomButton(
                        text: 'Done',
                        onPress: loading
                            ? null
                            : () async {
                                _loadingBloc.toggleState();
                                await HotelFirestore().createHotel(
                                    name: nameController.text,
                                    address: addressController.text,
                                    description: descriptionController.text,
                                    file: file,
                                    collectionImagePath:
                                        CollectionPath.hotelImage);
                                Navigator.of(context).pop("Success");
                              },
                        infiniti: false,
                      );
                    })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
