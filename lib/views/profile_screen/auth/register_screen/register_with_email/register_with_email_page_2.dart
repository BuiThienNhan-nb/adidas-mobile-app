import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/format.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_adidas_clone/views/utils/input/text_field_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class RegisterWithEmailPage2 extends StatefulWidget {
  const RegisterWithEmailPage2({Key? key}) : super(key: key);

  @override
  State<RegisterWithEmailPage2> createState() => _RegisterWithEmailPage2State();
}

class _RegisterWithEmailPage2State extends State<RegisterWithEmailPage2> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtNameController = TextEditingController();
    final TextEditingController _txtBirthdateController =
        TextEditingController();
    final _key = GlobalKey<FormState>();

    void pickDate() async {
      final initDate = _txtBirthdateController.text == ""
          ? DateTime(2001, 9, 25)
          : AppFormat.formatDay.parse(_txtBirthdateController.text);
      final pickDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary:
                    AppColors.iconBackgroundColor, // header background color
                onPrimary: AppColors.backgroundColor, // header text color
                onSurface: AppColors.iconBackgroundColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.iconBackgroundColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickDate == null) return;
      _txtBirthdateController.text = AppFormat.formatDay.format(pickDate);
    }

    register() {
      // Register success
      if (!_key.currentState!.validate()) {
        log('VALIDATE RETURN FALSE');
        return;
      }
      setState(() => context.read<AuthProvider>().isLoading = true);
      Future.delayed(const Duration(seconds: 3)).then(
        (val) {
          setState(() => context.read<AuthProvider>().isLogin = true);
          setState(() => context.read<AuthProvider>().isLoading = false);
          Navigator.of(context)
            ..popUntil(ModalRoute.withName(HomeScreen.id))
            ..push(
              CupertinoPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: AppColors.iconBackgroundColor,
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: false,
          leading: Container(),
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
                  "Complete your information to join with us",
                  style: GoogleFonts.cantarell(
                    color: AppColors.iconBackgroundColor,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: _key,
                child: Column(
                  children: [
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: _txtNameController,
                      textinputType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "Name is required"),
                          MinLengthValidator(4,
                              errorText: "Name must be at least 4 digits long"),
                        ],
                      ),
                      lableText: "NAME",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: _txtBirthdateController,
                      textinputType: TextInputType.emailAddress,
                      validator:
                          RequiredValidator(errorText: "Birthdate is required"),
                      onTap: () => pickDate(),
                      lableText: "BIRTHDATE",
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              MyTextButton(
                function: register,
                content: "JOIN US",
                isLoading: context.read<AuthProvider>().isLoading,
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
