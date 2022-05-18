import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/input/password_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
import '../../../../utils/widget/snack_bar.dart';
import '../../widget/auth_dialog.dart';
import 'register_with_email_page_2.dart';
// ignore: implementation_imports

// class RegisterWithEmail extends StatefulWidget {
//   const RegisterWithEmail({Key? key}) : super(key: key);

//   @override
//   State<RegisterWithEmail> createState() => _RegisterWithEmailState();
// }

class RegisterWithEmail extends StatelessWidget {
  const RegisterWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthProvider>();
    late User user;
    final TextEditingController txtEmailController = TextEditingController();
    final TextEditingController txtPasswordController = TextEditingController();
    final TextEditingController txtConfirmPasswordController =
        TextEditingController();
    final key = GlobalKey<FormState>();

    showVerifiedEmailDialog() => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: "We've sent email code to:",
            subTitle: txtEmailController.text,
            btnTitle: "PLEASE VERIFY YOUR EMAIL",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        );

    register() async {
      if (key.currentState!.validate()) {
        context.read<AuthProvider>().isLoading = true;
        log(txtEmailController.text);
        Map<String, dynamic> response = await auth.register(
            txtEmailController.text, txtPasswordController.text);
        if (response['status']) {
          user = User.fromMap(response['data']['user']);
          context.read<UserProvider>().setUser(user);
          // showVerifiedEmailDialog();
          context.read<AuthProvider>().isLoading = false;
          Navigator.of(context)
            ..pop()
            ..push(
              CupertinoPageRoute(
                builder: (context) => const RegisterWithEmailPage2(),
              ),
            );
          showSnackBar(context, "Register successfully", "Dismiss");
        } else {
          log('fail');
          // context.read<AuthProvider>().isLoading = false;
        }
      } else {
        log('VALIDATE RETURN FALSE');
      }
    }

    checkVerifyEmail() async {
      Map<String, dynamic> response =
          await auth.checkEmail(context.read<UserProvider>().user.id);

      if (response['data']) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const RegisterWithEmailPage2(),
          ),
        );
      } else {
        log('failed');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.iconBackgroundColor,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          "REGISTER",
          style: AppStyles.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 72.w),
              child: Text(
                "No account, so let's get you once",
                style: GoogleFonts.cantarell(
                  color: AppColors.iconBackgroundColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Form(
              key: key,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFieldInput(
                    onTextSubmitted: (str) {},
                    textController: txtEmailController,
                    textinputType: TextInputType.emailAddress,
                    validator: AppValidators.emailValidator,
                    lableText: "EMAIL",
                  ),
                  PasswordFieldInput(
                    onTextSubmitted: (str) {},
                    textController: txtPasswordController,
                    textinputType: TextInputType.emailAddress,
                    validator: AppValidators.passwordValidator,
                    lableText: "PASSWORD",
                    obcureText: true,
                  ),
                  PasswordFieldInput(
                    onTextSubmitted: (str) {},
                    textController: txtConfirmPasswordController,
                    textinputType: TextInputType.emailAddress,
                    validator: (str) => MatchValidator(
                            errorText: "Password do not match")
                        .validateMatch(str!, txtPasswordController.text.trim()),
                    lableText: "CONFIRM PASSWORD",
                    obcureText: true,
                  ),
                ],
              ),
            ),
            // Consumer<AuthProvider>(
            //   builder: (_, value, __) {
            //     return context.read<UserProvider>().isStepOneRegister
            //         ? MyTextButton(
            //             function: checkVerifyEmail,
            //             content: "NEXT STEP",
            //             isLoading: context.read<AuthProvider>().isLoading,
            //           )
            //         : const SizedBox.shrink();
            //   },
            // ),
            const Expanded(child: SizedBox()),
            Consumer<AuthProvider>(builder: (_, value, __) {
              return MyTextButton(
                function: register,
                content: "REGISTER",
                isLoading: context.read<AuthProvider>().isLoading,
              );
            }),
            // MyTextButton(
            //   function: () {
            //     if (!key.currentState!.validate()) {
            //       log('VALIDATE RETURN FALSE');
            //       return;
            //     }
            //     /// Fake function create account
            //     setState(() => context.read<AuthProvider>().isLoading = true);
            //     Future.delayed(
            //       const Duration(seconds: 3),
            //     ).then((value) {
            //       setState(
            //           () => context.read<AuthProvider>().isLoading = false);
            //       // Push to screen complete user info
            //       Navigator.push(
            //         context,
            //         CupertinoPageRoute(
            //           builder: (context) => const RegisterWithEmailPage2(),
            //         ),
            //       );
            //       showSnackBar();
            //     });
            //   },
            //   content: "REGISTER",
            //   isLoading: context.read<AuthProvider>().isLoading,
            // ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
