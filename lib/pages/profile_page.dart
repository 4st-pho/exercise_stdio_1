import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/change_image_bloc.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/helper/hide_keyboard.dart';
import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/pages/widgets/profile_text_form_field_name.dart';
import 'package:stdio_week_6/services/cloud_firestore/user_firestore.dart';
import 'package:stdio_week_6/services/firebase_auth/firebase_auth_methods.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';
import 'package:stdio_week_6/widgets/circular_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFIle;
  final _changeImageBloc = ChangeImageBloc();
  final _loadingBloc = LoadingBloc();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController.text = currenUser.name;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    _loadingBloc.dispose();
    _changeImageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        hideKeyboard(context: context);
      },
      child: Container(
        color: MyColor.primaryGrey,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              decoration: const BoxDecoration(
                  color: MyColor.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 3,
                          child: Form(
                              key: _formKey,
                              child: ProfileTextFormFeildName(
                                  nameController: nameController)),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                    const Spacer(flex: 6),
                    StreamBuilder<bool>(
                        stream: _loadingBloc.stream,
                        initialData: false,
                        builder: (context, snapshot) {
                          final isLoading = snapshot.data!;
                          return CustomButton(
                            text: 'Update',
                            onPress: isLoading
                                ? null
                                : () async {
                                    hideKeyboard(context: context);
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    _loadingBloc.toggleState();
                                    await UserFirestore().updateUserProfile(
                                        name: nameController.text,
                                        file: imageFIle,
                                        context: context,
                                        avataLink: currenUser.avatar);
                                    _loadingBloc.toggleState();
                                    resetUser();
                                  },
                            color: Colors.deepPurple,
                          );
                        }),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: screenWidth / 2 - 56,
              child: _buildPickImage(),
            ),
            Positioned(
              top: 170,
              right: screenWidth / 2 - 60,
              child: CircularButton(
                icon: Icons.edit,
                onTap: () async => await _changeImageBloc.getImage(),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: CircularButton(
                icon: Icons.exit_to_app,
                color: Colors.deepPurple,
                buttonSize: 35,
                onTap: () async =>
                    await FirebaseAuthMethods().logOut(context: context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<File?> _buildPickImage() {
    return StreamBuilder<File?>(
        stream: _changeImageBloc.stream,
        initialData: null,
        builder: (context, snapshot) {
          final file = snapshot.data;
          imageFIle = file;

          return CircleAvatar(
            radius: 56,
            backgroundColor: MyColor.background,
            child: CircleAvatar(
              radius: 52,
              backgroundColor: MyColor.primaryGrey,
              child: file == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(52),
                      child: Image.network(
                        currenUser.avatar,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(52),
                      child: Image.file(
                        file,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )),
            ),
          );
        });
  }
}
