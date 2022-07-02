import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/loading_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/build_text_form_field.dart';
import 'package:stdio_week_6/services/firebase_auth/firebase_auth_methods.dart';
import 'package:stdio_week_6/widgets/custom_button.dart';

class ResetPasswordPage extends StatefulWidget {
  final String initEmail;
  const ResetPasswordPage({Key? key, required this.initEmail})
      : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController _emailController;
  final _loadingBloc = LoadingBloc();
  @override
  void initState() {
    _emailController = TextEditingController();
    _emailController.text = widget.initEmail;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _loadingBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              AssetsIcon.arrowBack,
              height: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reset password',
                style: MyFont.blackHeading,
              ),
              const Flexible(child: SizedBox(height: 24)),
              const Text(
                'Enter the email associated with your account and we\'ll send an email with instruction to reset your password',
                style: MyFont.greyTitle,
              ),
              const Flexible(child: SizedBox(height: 40)),
              buildTextFormFeild(
                  controller: _emailController,
                  title: 'Email address',
                  type: TextInputType.emailAddress),
              const Flexible(child: SizedBox(height: 16)),
              StreamBuilder<bool>(
                  stream: _loadingBloc.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    final isloading = snapshot.data!;
                    return CustomButton(
                        text: 'Send instructions',
                        onPress: isloading
                            ? null
                            : () {
                                _loadingBloc.toggleState();
                                FirebaseAuthMethods().resetPassword(
                                    context: context,
                                    email: _emailController.text);
                                _loadingBloc.toggleState();
                              });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
