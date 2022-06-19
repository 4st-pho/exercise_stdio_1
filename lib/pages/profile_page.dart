import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/change_image_bloc.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/constants/assest_image.dart';
import 'package:stdio_week_6/helper/show_snackbar.dart';
import 'package:stdio_week_6/models/user.dart';
import 'package:stdio_week_6/services/cloud_firestore/user_firestore.dart';
import 'package:stdio_week_6/services/firebase_auth/firebase_auth_methods.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';

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
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Profile',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                StreamBuilder<File?>(
                    stream: _changeImageBloc.stream,
                    initialData: null,
                    builder: (context, snapshot) {
                      final file = snapshot.data;
                      imageFIle = file;

                      return ClipOval(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: file == null
                              ? FadeInImage.assetNetwork(
                                  placeholder: AssetsImage.fadeImageUser,
                                  image: currenUser.avatar,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(file, fit: BoxFit.cover),
                        ),
                      );
                    }),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: InkWell(
                    onTap: () async {
                      await _changeImageBloc.getImage();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple, shape: BoxShape.circle),
                      child:
                          const Icon(Icons.edit, size: 22, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.deepPurple, fontSize: 30),
              decoration: const InputDecoration(
                label: Text('name'),
                labelStyle: TextStyle(color: Colors.deepPurple, fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
              ),
            ),
            const SizedBox(height: 60),
            StreamBuilder<bool>(
                stream: _loadingBloc.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox(
                      height: 53,
                    );
                  }
                  final isLoading = snapshot.data!;
                  return CustomButton(
                    text: 'Update',
                    onPress: isLoading
                        ? null
                        : () async {
                            _loadingBloc.toggleState();
                            await UserFirestore().updateUserProfile(
                                name: nameController.text,
                                file: imageFIle,
                                avataLink: currenUser.avatar);
                            _loadingBloc.toggleState();
                            showSnackBar(
                                context: context, content: 'Update success!');
                            resetUser();
                          },
                    color: Colors.deepPurple,
                  );
                }),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Log out',
              onPress: () async {
                await FirebaseAuthMethods().logOut(context: context);
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
