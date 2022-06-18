import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stdio_week_6/helper/show_snackbar.dart';
import 'package:stdio_week_6/services/cloud_firestore/user_firestore.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Send email verification
  Future<void> sendEmailVerification({
    required BuildContext context,
  }) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackBar(context: context, content: 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!, error: true);
    }
  }

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  //Sign up
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      await UserFirestore()
          .createUser(uid: FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!, error: true);
    }
  }

  //Sign in
  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!, error: true);
    }
  }

  //Log out
  Future<void> logOut({required BuildContext context}) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!, error: true);
    }
  }
}
