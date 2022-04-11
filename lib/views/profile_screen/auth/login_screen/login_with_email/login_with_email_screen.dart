import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ).then(
          (value) =>
              setState(() => context.read<AuthProvider>().isLoading = false),
        );
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
    login() {
      setState(() => context.read<AuthProvider>().isLoading = true);
      showFailDialog();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        shadowColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColors.kIconBackgroundColor,
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
                  color: AppColors.kIconBackgroundColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextFieldInput(
              onTextSubmitted: (str) {},
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
              onTextSubmitted: (str) {},
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
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: showForgotPasswordDialog,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  primary: AppColors.kButtonOnClick,
                ),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: AppColors.kIconBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            MyTextButton(
              function: login,
              content: "SIGN IN",
              isLoading: context.read<AuthProvider>().isLoading,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
