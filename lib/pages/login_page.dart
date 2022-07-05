import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/blocs/swap_show_hide_bloc.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/animation/custom_page_transition.dart';
import 'package:stdio_week_6/helper/build_password_text_form_field.dart';
import 'package:stdio_week_6/helper/build_text_form_field.dart';
import 'package:stdio_week_6/helper/hide_keyboard.dart';
import 'package:stdio_week_6/pages/sign_up_page.dart';
import 'package:stdio_week_6/pages/reset_password_page.dart';
import 'package:stdio_week_6/services/firebase_auth/firebase_auth_methods.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';
import 'package:stdio_week_6/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _swapShowHidePassword = SwapShowHideBloc();
  final _loadingBloc = LoadingBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _swapShowHidePassword.dispose();
    _loadingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
         hideKeyboard(context: context);
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Logo(),
              const SizedBox(height: 92),
              const Text('Welcome to comdote!', style: MyFont.blackHeading),
              const SizedBox(height: 4),
              const Text('Alive with your style of living!',
                  style: MyFont.greySubtitle),
              const SizedBox(height: 28),
              Padding(
                  padding: const EdgeInsets.all(32),
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
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
                        const SizedBox(height: 40),
                        StreamBuilder<bool>(
                            stream: _loadingBloc.stream,
                            initialData: false,
                            builder: (context, snapshot) {
                              final isLoading = snapshot.data!;
                              return CustomButton(
                                text: 'Login',
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
                                            .signinWithEmailAndPassword(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                                context: context);
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        _loadingBloc.toggleState();
                                      },
                              );
                            })
                      ]))),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(
                          initEmail: _emailController.text,
                        ))),
                child: const Text(
                  'Forgot password?',
                  style: MyFont.blueSubtitle,
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  style: MyFont.blackText,
                  text: 'You don\'t have an account? ',
                  children: [
                    TextSpan(
                      text: 'Sign up here.',
                      style: const TextStyle(
                          color: MyColor.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                              CustomPageTransition(child: const SignUpPage()));
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
