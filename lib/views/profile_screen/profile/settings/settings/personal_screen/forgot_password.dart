import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/size.dart';
import '../../../../../../configs/style.dart';
import '../../../../../../configs/validator.dart';
import '../../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../../../../../utils/input/password_field_input.dart';
import '../../../../auth/widget/auth_dialog.dart';

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
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "CHANGE PASSWORD",
          style: AppStyles.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: AppSizes.navBarIconSize + 8,
              color: AppColors.blackColor,
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
                  color: AppColors.blackColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            PasswordFieldInput(
              onTextSubmitted: (str) {},
              textController: _txtPasswordController,
              textInputType: TextInputType.emailAddress,
              validator: AppValidators.passwordValidator,
              labelText: "PASSWORD",
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
                  primary: AppColors.nobelColor,
                ),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: AppColors.blackColor,
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
