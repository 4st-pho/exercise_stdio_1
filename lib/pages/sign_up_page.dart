import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/blocs/swap_show_hide_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/build_password_text_form_field.dart';
import 'package:stdio_week_6/helper/hide_keyboard.dart';
import 'package:stdio_week_6/helper/show_snackbar.dart';
import 'package:stdio_week_6/services/firebase_auth/firebase_auth_methods.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';
import 'package:stdio_week_6/widgets/logo.dart';

import '../helper/build_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final _swapShowHidePassword = SwapShowHideBloc();
  final _swapShowHideConfirmPassword = SwapShowHideBloc();
  final _loadingBloc = LoadingBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _swapShowHidePassword.dispose();
    _swapShowHideConfirmPassword.dispose();
    _confirmPasswordController.dispose();
    _loadingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: IconButton(
                icon: Image.asset(
                  AssetsIcon.arrowBack,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: GestureDetector(
          onTap: () {
            hideKeyboard(context: context);
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Logo(),
                const SizedBox(height: 92),
                const Text('Sign up comdote!', style: MyFont.blackHeading),
                const SizedBox(height: 4),
                const Text('Alive with your style of living!',
                    style: MyFont.greySubtitle),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        BuildTextFormFeild(
                            controller: _emailController,
                            title: 'Email',
                            type: TextInputType.emailAddress,
                            showLabel: false),
                        const SizedBox(height: 16),
                        StreamBuilder<bool>(
                            stream: _swapShowHidePassword.stream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final isPasswordVisible = snapshot.data!;
                              return BuildPasswordTextFormField(
                                  controller: _passwordController,
                                  title: 'Password',
                                  isPasswordVisible: isPasswordVisible,
                                  onToggleState: () {
                                    _swapShowHidePassword.toggleShow();
                                  },
                                  onValidate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    if (value.length <= 7) {
                                      return 'Password must be more than 7 characters';
                                    }
                                    return null;
                                  });
                            }),
                        const SizedBox(height: 16),
                        StreamBuilder<bool>(
                            stream: _swapShowHideConfirmPassword.stream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final isPasswordVisible = snapshot.data!;
                              return BuildPasswordTextFormField(
                                  controller: _confirmPasswordController,
                                  title: 'Confirm password',
                                  isPasswordVisible: isPasswordVisible,
                                  onToggleState: () {
                                    _swapShowHideConfirmPassword.toggleShow();
                                  },
                                  onValidate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    if (value.length <= 7) {
                                      return 'Password must be more than 7 characters';
                                    }
                                    if (value != _passwordController.text) {
                                      return 'Not the same as the password';
                                    }
                                    return null;
                                  });
                            }),
                        const SizedBox(height: 40),
                        StreamBuilder<bool>(
                            stream: _loadingBloc.stream,
                            initialData: false,
                            builder: (context, snapshot) {
                              final isLoading = snapshot.data!;
                              return CustomButton(
                                text: 'Sign up',
                                onPress: isLoading
                                    ? null
                                    : () async {
                                        hideKeyboard(context: context);
                                        _loadingBloc.toggleState();
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          _loadingBloc.toggleState();
                                          return;
                                        }
                                        FirebaseAuthMethods()
                                            .signUpWithEmailAndPassword(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                                context: context)
                                            .then((value) async {
                                          if (value == 'success') {
                                            showSnackBar(
                                                context: context,
                                                content: value);
                                          } else {
                                            _loadingBloc.toggleState();
                                          }
                                          await Future.delayed(
                                              const Duration(seconds: 2));
                                        });
                                      },
                              );
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}