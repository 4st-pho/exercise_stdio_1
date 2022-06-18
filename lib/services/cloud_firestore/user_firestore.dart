import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stdio_week_6/constants/collection_path.dart';
import 'package:stdio_week_6/models/user.dart' as model;
import 'package:stdio_week_6/services/firebase_storage/storage_methods.dart';

class UserFirestore {
  final _firestore = FirebaseFirestore.instance;
  // create user
  Future<void> createUser({required String uid}) async {
    final docUser = _firestore.collection(CollectionPath.users).doc(uid);
    final user = model.User(
        id: uid,
        avatar:
            'https://www.seekpng.com/png/full/356-3562377_personal-user.png',
        follow: [],
        name: 'user');
    await docUser.set(user.toJson());
  }

  //get curent user in cloud firestore

  Future<model.User> getUser(
      {required String uid, bool currenUser = false}) async {
    final docUser = _firestore
        .collection(CollectionPath.users)
        .doc(currenUser ? FirebaseAuth.instance.currentUser!.uid : uid);
    final snapshot = await docUser.get();
    return model.User.fromJson(snapshot.data()!);
  }

  Future updateUserProfile(
      {required String name,
      required File? file,
      required String avataLink}) async {
    String avatar = file == null
        ? avataLink
        : await StorageMethos()
            .uploadAndGetImageLink(CollectionPath.users, file);
    final docUser = _firestore
        .collection(CollectionPath.users)
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await docUser.update({'name': name.trim(), 'avatar': avatar});
  }

  void updateFollow({required List<String> follow}) async {
    final docUser = _firestore
        .collection(CollectionPath.users)
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await docUser.update({'follow': follow.toList()});
  }
}
