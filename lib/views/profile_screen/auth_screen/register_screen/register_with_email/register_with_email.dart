import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/utils/button/login_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWithEmail extends StatelessWidget {
  const RegisterWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtEmailController = TextEditingController();
    final TextEditingController _txtPasswordController =
        TextEditingController();
    final TextEditingController _txtConfirmPasswordController =
        TextEditingController();

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
            LoginButton(
              function: () {},
              content: "REGISTER",
              isValid: true,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
