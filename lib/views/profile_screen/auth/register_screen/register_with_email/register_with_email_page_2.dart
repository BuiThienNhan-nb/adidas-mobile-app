import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/widget/snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../configs/format.dart';
import '../../../../../configs/palette.dart';
import '../../../../../configs/style.dart';
import '../../../../../configs/validator.dart';
import '../../../../../models/user.dart';
import '../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../view_models/auth_view_model/user_provider.dart';
import '../../../../home_screen.dart';
import '../../../../utils/button/my_text_button.dart';
import '../../../../utils/input/text_field_input.dart';

// class RegisterWithEmailPage2 extends StatefulWidget {
//   const RegisterWithEmailPage2({Key? key}) : super(key: key);

//   @override
//   State<RegisterWithEmailPage2> createState() => _RegisterWithEmailPage2State();
// }

class RegisterWithEmailPage2 extends StatelessWidget {
  const RegisterWithEmailPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtNameController = TextEditingController();
    final TextEditingController _txtBirthdateController =
        TextEditingController();
    final _key = GlobalKey<FormState>();
    final userProvider = context.read<UserProvider>();

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
                primary: AppColors.blackColor, // header background color
                onPrimary: AppColors.whiteColor, // header text color
                onSurface: AppColors.blackColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.blackColor, // button text color
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

    register() async {
      context.read<AuthProvider>().isLoading = true;
      Map<String, dynamic> response = await userProvider.updateUserInfo(
        context.read<UserProvider>().user.id,
        _txtNameController.text,
        _txtBirthdateController.text,
      );
      if (response['status']) {
        // userProvider.setUser(User.fromMap(response['data']));
        print(response['data']);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
        context.read<AuthProvider>().isLoading = false;
        context.read<AuthProvider>().isLogin = true;

        showSnackBar(
          context,
          "Welcome to Adidas ${_txtNameController.text}",
          "Dismiss",
        );
      } else {
        log('failed');

        /// Fake update user
        userProvider.user.fullName = _txtNameController.text.trim();
        userProvider.user.dateOfBirth =
            AppFormat.formatDay.parse(_txtBirthdateController.text);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
        context.read<AuthProvider>().isLoading = false;
        showSnackBar(
          context,
          "Welcome to Adidas ${_txtNameController.text}",
          "Dismiss",
        );
      }

      // Register success
      // if (!_key.currentState!.validate()) {
      //   log('VALIDATE RETURN FALSE');
      //   return;
      // }
      // setState(() => context.read<AuthProvider>().isLoading = true);
      // Future.delayed(const Duration(seconds: 3)).then(
      //   (val) {
      //     setState(() => context.read<AuthProvider>().isLogin = true);
      //     setState(() => context.read<AuthProvider>().isLoading = false);
      //     Navigator.of(context)
      //       ..popUntil(ModalRoute.withName(HomeScreen.id))
      //       ..push(
      //         CupertinoPageRoute(
      //           builder: (context) => const HomeScreen(),
      //         ),
      //       );
      //   },
      // );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: AppColors.blackColor,
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
                    color: AppColors.blackColor,
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
                      textController: _txtNameController,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.nameValidator,
                      labelText: "NAME",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: _txtBirthdateController,
                      textInputType: TextInputType.emailAddress,
                      validator:
                          RequiredValidator(errorText: "Birthdate is required"),
                      onTap: () => pickDate(),
                      labelText: "BIRTHDATE",
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Consumer<AuthProvider>(builder: (_, value, __) {
                return MyTextButton(
                  function: register,
                  content: "JOIN US",
                  isLoading: context.read<AuthProvider>().isLoading,
                );
              }),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
