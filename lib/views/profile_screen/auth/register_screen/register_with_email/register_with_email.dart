import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/configs/validator.dart';
import 'package:flutter_adidas_clone/models/user.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/register_screen/register_with_email/register_with_email_page_2.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports

class RegisterWithEmail extends StatefulWidget {
  const RegisterWithEmail({Key? key}) : super(key: key);

  @override
  State<RegisterWithEmail> createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthProvider>();
    late User user;
    final TextEditingController _txtEmailController = TextEditingController();
    final TextEditingController _txtPasswordController =
        TextEditingController();
    final TextEditingController _txtConfirmPasswordController =
        TextEditingController();
    final _key = GlobalKey<FormState>();

    showVerifiedEmailDialog() => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: "We've sent email code to:",
            subTitle: _txtEmailController.text,
            btnTitle: "PLEASE VERIFY YOUR EMAIL",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        );

    showSnackBar() {
      SnackBar snackBar = SnackBar(
        duration: const Duration(milliseconds: 400),
        content: const Text(
          "Register successfully",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        action: SnackBarAction(
          label: "Dismiss",
          textColor: AppColors.backgroundColor,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    register() async {
      context.read<AuthProvider>().isLoading = true;
      log(_txtEmailController.text);
      Map<String, dynamic> response = await auth.register(
          _txtEmailController.text, _txtPasswordController.text);
      if (response['status']) {
        user = User.fromJson(response['data']['user']);
        context.read<UserProvider>().setUser(user);
        showVerifiedEmailDialog();
        context.read<AuthProvider>().isLoading = false;
      } else {
        log('fail');
        context.read<AuthProvider>().isLoading = false;
      }
    }

    checkVefifyEmail() async {
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
        log('falied');
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
                  TextFieldInput(
                    onTextSubmitted: (str) {},
                    textController: _txtConfirmPasswordController,
                    textinputType: TextInputType.emailAddress,
                    validator: (str) =>
                        MatchValidator(errorText: "Password do not match")
                            .validateMatch(
                                str!, _txtPasswordController.text.trim()),
                    lableText: "CONFIRM PASSWORD",
                    obcureText: true,
                  ),
                ],
              ),
            ),
            Consumer<AuthProvider>(
              builder: (_, value, __) {
                return context.read<UserProvider>().isStepOneRegister
                    ? MyTextButton(
                        function: checkVefifyEmail,
                        content: "NEXT STEP",
                        isLoading: context.read<AuthProvider>().isLoading,
                      )
                    : const SizedBox.shrink();
              },
            ),
            const Expanded(child: SizedBox()),
            Consumer<AuthProvider>(builder: (_, value, __) {
              return MyTextButton(
                function: register,
                content: "REGISTER",
                isLoading: context.read<AuthProvider>().isLoading,
              );
            }),
            MyTextButton(
              function: () {
                if (!_key.currentState!.validate()) {
                  log('VALIDATE RETURN FALSE');
                  return;
                }

                /// Fake function create account
                setState(() => context.read<AuthProvider>().isLoading = true);
                Future.delayed(
                  const Duration(seconds: 3),
                ).then((value) {
                  setState(
                      () => context.read<AuthProvider>().isLoading = false);
                  // Push to screen complete user info
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RegisterWithEmailPage2(),
                    ),
                  );
                  showSnackBar();
                });
              },
              content: "REGISTER",
              isLoading: context.read<AuthProvider>().isLoading,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
