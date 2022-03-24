import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/register_screen/register_with_email/register_with_email_page_2.dart';
import 'package:flutter_adidas_clone/views/utils/button/login_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class RegisterWithEmail extends StatefulWidget {
  const RegisterWithEmail({Key? key}) : super(key: key);

  @override
  State<RegisterWithEmail> createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtEmailController = TextEditingController();
    final TextEditingController _txtPasswordController =
        TextEditingController();
    final TextEditingController _txtConfirmPasswordController =
        TextEditingController();

    showSnackBar() {
      SnackBar snackBar = SnackBar(
        duration: const Duration(milliseconds: 400),
        content: const Text(
          "Register successfully",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        action: SnackBarAction(
          label: "Dismiss",
          textColor: AppColor.kBackgroundColor,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          "REGISTER",
          style: AppStyle.titleTextStyle,
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
            TextFieldInput(
              onTextChanged: (str) {},
              textController: _txtConfirmPasswordController,
              textinputType: TextInputType.emailAddress,
              validator: (str) =>
                  MatchValidator(errorText: "Password do not match")
                      .validateMatch(str!, _txtPasswordController.text.trim()),
              lableText: "CONFIRM PASSWORD",
              obcureText: true,
            ),
            const Expanded(child: SizedBox()),
            AuthButton(
              function: () {
                // Fake function create account
                // setState(() => context.read<AuthProvider>().isLoading = true);
                // Future.delayed(
                //   const Duration(seconds: 3),
                // ).then((value) {
                //   setState(
                //       () => context.read<AuthProvider>().isLoading = false);

                //   // Push to screen complete user info
                //   Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //       builder: (context) => const RegisterWithEmailPage2(),
                //     ),
                //   );
                //   showSnackBar();
                // });
                DataRepository()
                    .register(
                        _txtEmailController.text, _txtPasswordController.text)
                    .then((response) => {
                          if (response.data)
                            {
                              // show dialog for register success
                            }
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
