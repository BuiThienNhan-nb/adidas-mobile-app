import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../configs/palette.dart';
import '../../../../../configs/style.dart';
import '../../../../../configs/validator.dart';
import '../../../../../models/user.dart';
import '../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../view_models/auth_view_model/user_provider.dart';
import '../../../../utils/button/my_text_button.dart';
import '../../../../utils/input/text_field_input.dart';
import '../../widget/auth_dialog.dart';
// ignore: implementation_imports

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController _txtEmailController = TextEditingController();
  final TextEditingController _txtPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = context.read<AuthProvider>();

    late User user;

    showFailDialog(String subTitle) => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: "Login Failed",
            subTitle: subTitle,
            btnTitle: "OK",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        ).then((value) => context.read<AuthProvider>().isLoading = false);
    showForgotPasswordDialog() => showAnimatedDialog(
          context: context,
          builder: (context) => const AuthDialog(
            title: "We've sent your reset password link to:",
            subTitle: "buithiennhan250901@gmail.com",
            btnTitle: "TRY LOGGING IN AGAIN",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        );

    login() async {
      if (!_key.currentState!.validate()) {
        return;
      } else {
        log('1');
      }
      context.read<AuthProvider>().isLoading = true;
      Map<String, dynamic> response = await auth.fetchLogin(
          _txtEmailController.text, _txtPasswordController.text);

      if (response['status']) {
        if (response['data']['user']['isVerifiedEmail']) {
          user = User.fromJson(response['data']['user']);
          context.read<UserProvider>().setUser(user);
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                    title: Text("Success!!"),
                    content: Text("Navigate to another screen"));
              });
          context.read<AuthProvider>().isLoading = false;
        } else {
          showFailDialog(
              "Your email haven't access please check your mail box to verify your email");
        }
        user = User.fromJson(response['data']['user']);
        context.read<UserProvider>().setUser(user);
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Success!!"),
              content: Text("Navigate to another screen"),
            );
          },
        );
        context.read<AuthProvider>().isLoading = false;
      } else {
        showFailDialog(
            "We didn't recognize the username or password you entered. Please try again.");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        shadowColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColors.iconBackgroundColor,
        ),
        centerTitle: false,
        title: Text(
          "LOGIN",
          style: AppStyles.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 72.w),
              child: Text(
                "Looks like we already know you",
                style: GoogleFonts.cantarell(
                  color: AppColors.iconBackgroundColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Form(
              key: _key,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFieldInput(
                    onTextSubmitted: (str) {},
                    textController: _txtEmailController,
                    textinputType: TextInputType.emailAddress,
                    validator: AppValidators.emailValidator,
                    lableText: "EMAIL",
                  ),
                  TextFieldInput(
                    onTextSubmitted: (str) {},
                    textController: _txtPasswordController,
                    textinputType: TextInputType.emailAddress,
                    validator: AppValidators.passwordValidator,
                    lableText: "PASSWORD",
                    obcureText: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TextButton(
                onPressed: showForgotPasswordDialog,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  primary: AppColors.buttonOnClick,
                ),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: AppColors.iconBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            // MyTextButton(
            //   function: login,
            //   content: "SIGN IN",
            //   isLoading: context.read<AuthProvider>().isLoading,
            // ),
            Consumer<AuthProvider>(
              builder: (_, value, __) {
                return MyTextButton(
                  function: login,
                  content: "SIGN IN",
                  isLoading: value.isLoading,
                );
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
