import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/user.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/button/login_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthProvider>();
    late User user;
    final TextEditingController _txtEmailController = TextEditingController();
    final TextEditingController _txtPasswordController =
        TextEditingController();

    showFailDialog() => showAnimatedDialog(
          context: context,
          builder: (context) => const AuthDialog(
            title: "Login Failed",
            subTitle:
                "We didn't recognize the username or password you entered. Please try again.",
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
      context.read<AuthProvider>().isLoading = true;
      Map<String, dynamic> response = await auth.fetchLogin(
          _txtEmailController.text, _txtPasswordController.text);
      if (response['status']) {
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
        showFailDialog();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColor,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColor.kIconBackgroundColor,
        ),
        centerTitle: false,
        title: Text(
          "LOGIN",
          style: AppStyle.titleTextStyle,
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
                  color: AppColor.kIconBackgroundColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextFieldInput(
              onTextChanged: (str) {},
              textController: _txtEmailController,
              textinputType: TextInputType.emailAddress,
              validator: MultiValidator(
                [
                  EmailValidator(errorText: "Please enter a valid email!"),
                  RequiredValidator(errorText: "Email is required"),
                ],
              ),
              lableText: "EMAIL",
            ),
            TextFieldInput(
              onTextChanged: (str) {},
              textController: _txtPasswordController,
              textinputType: TextInputType.emailAddress,
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: "Password is required"),
                  MinLengthValidator(8,
                      errorText: "Password must be at least 8 digits long"),
                ],
              ),
              lableText: "PASSWORD",
              obcureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TextButton(
                onPressed: showForgotPasswordDialog,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  primary: AppColor.kButtonOnClick,
                ),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: AppColor.kIconBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Consumer<AuthProvider>(
              builder: (_, value, __) {
                return AuthButton(
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
