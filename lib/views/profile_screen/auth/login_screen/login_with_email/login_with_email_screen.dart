import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_adidas_clone/view_models/wish_list_view_model/wish_list_provider.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_adidas_clone/views/utils/input/password_field_input.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../widget/auth_dialog.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtEmailController = TextEditingController();
    final TextEditingController _txtPasswordController =
        TextEditingController();
    final _key = GlobalKey<FormState>();

    AuthProvider auth = context.read<AuthProvider>();

    late User user;

    showFailDialog(String subTitle) => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: "Login Failed",
            subTitle: subTitle,
            btnTitle: "OK",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        ).then((value) => context.read<AuthProvider>().isLoading = false);

    showSuccessDialog(String subTitle) => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: "Login success",
            subTitle: subTitle,
            btnTitle: "OK",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        ).then((value) {
          context.read<AuthProvider>().isLoading = false;
          context.read<AuthProvider>().isLogin = true;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => const HomeScreen()),
              (router) => false);
        });
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
    Future<void> getWishList() async {
      context.read<WishListProvider>().listWish = await DataRepository()
          .getListBag(id: context.read<UserProvider>().user.id);
    }

    Future<void> getCartList() async {
      context.read<CartProvider>().listProduct = await DataRepository()
          .getListBag(id: context.read<UserProvider>().user.id);
    }

    login() async {
      if (_key.currentState!.validate()) {
        log('VALIDATE RETURN TRUE');
        context.read<AuthProvider>().isLoading = true;
        Map<String, dynamic> response = await auth.fetchLogin(
            _txtEmailController.text, _txtPasswordController.text);

        if (response['status']) {
          if (response['data']['user']['isVerifiedEmail']) {
            user = User.fromMap(response['data']['user']);
            context.read<UserProvider>().setUser(user);
            await getWishList();
            await getCartList();
            showSuccessDialog('welcom to adidas');
            auth.isLoading = false;
          } else {
            showFailDialog(
                "Your email haven't access please check your mail box to verify your email");
            auth.isLoading = false;
          }
          // user = User.fromJson(response['data']['user']);
          // context.read<UserProvider>().setUser(user);
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return const AlertDialog(
          //       title: Text("Success!!"),
          //       content: Text("Navigate to another screen"),
          //     );
          //   },
          // );
        } else {
          showFailDialog(
              "We didn't recognize the username or password you entered. Please try again.");
        }
      } else {
        log('VALIDATE RETURN FALSE');
      }
    }

    void getUserInfo() {}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        shadowColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColors.blackColor,
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
                    textController: _txtEmailController,
                    textInputType: TextInputType.emailAddress,
                    validator: AppValidators.emailValidator,
                    labelText: "EMAIL",
                  ),
                  PasswordFieldInput(
                    onTextSubmitted: (str) {},
                    textController: _txtPasswordController,
                    textInputType: TextInputType.emailAddress,
                    validator: AppValidators.passwordValidator,
                    labelText: "PASSWORD",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
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
            const Expanded(child: SizedBox()),
            // MyTextButton(
            //   function: login,
            //   content: "SIGN IN",
            //   isLoading: context.read<AuthProvider>().isLoading,
            // ),
            Consumer<AuthProvider>(
              builder: (_, value, __) {
                return MyTextButton(
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
