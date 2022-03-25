import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/password_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = "ForgotPasswordScreen";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtPasswordController =
        TextEditingController();

    onBtnTap() {
      setState(() => context.read<AuthProvider>().isLoading = true);
      Future.delayed(const Duration(seconds: 2)).then(
        (val) {
          setState(() => context.read<AuthProvider>().isLoading = false);
          // do things
        },
      );
    }

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "CHANGE PASSWORD",
          style: AppStyle.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: AppSize.navBarIconSize + 8,
              color: AppColor.kIconBackgroundColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Enter your password to continue",
                style: GoogleFonts.cantarell(
                  color: AppColor.kIconBackgroundColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            PasswordFieldInput(
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
            ),
            MyTextButton(
              function: onBtnTap,
              content: "CONTINUE",
              isLoading: context.read<AuthProvider>().isLoading,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
          ],
        ),
      ),
    );
  }
}
