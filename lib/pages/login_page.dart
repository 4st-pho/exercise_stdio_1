import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/login_bloc.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/pages/my_bottom_app_bar.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';
import 'package:stdio_week_6/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _loginBloc = LoginBloc();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
            child: Column(
              children: [
                SizedBox(
                  height: 53,
                  child: TextField(
                    style: const TextStyle(fontSize: 14),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: MyDecoration.outlineInputBorder,
                      hintText: 'Email',
                      fillColor: Colors.transparent,
                      filled: true,
                      hintStyle: MyFont.greyLabel,
                      enabledBorder: MyDecoration.outlineInputBorder,
                      focusedBorder: MyDecoration.outlineInputBorder,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                StreamBuilder<bool>(
                    stream: _loginBloc.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final isPasswordVisible = snapshot.data!;
                      return SizedBox(
                        height: 53,
                        child: TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: !isPasswordVisible,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: MyColor.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: MyColor.grey,
                                    ),
                              onPressed: () {
                                _loginBloc.toggleShow();
                              },
                            ),
                            border: MyDecoration.outlineInputBorder,
                            hintText: 'Password',
                            fillColor: Colors.transparent,
                            filled: true,
                            hintStyle: MyFont.greyLabel,
                            enabledBorder: MyDecoration.outlineInputBorder,
                            focusedBorder: MyDecoration.outlineInputBorder,
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'Login',
                  onPress: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyBottomAppBar()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
