import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_app_bar.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/login_screen/login_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/register_screen/register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String id = "AuthScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset("assets/images/auth-background.jpg"),
              ),
            ),
            Container(
              height: 120.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  AuthButton(
                    backgroundColor: AppColors.kBackgroundColor,
                    title: "L O G I N",
                    fontColor: AppColors.kIconBackgroundColor,
                    onPress: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  ),
                  AuthButton(
                    backgroundColor: AppColors.kIconBackgroundColor,
                    title: "R E G I S T E R",
                    fontColor: AppColors.kBackgroundColor,
                    onPress: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                  ),
                  //SizedBox(height: 5.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required Color backgroundColor,
    required String title,
    required Color fontColor,
    required Function() onPress,
  })  : _backgroundColor = backgroundColor,
        _title = title,
        _fontColor = fontColor,
        _onPress = onPress,
        super(key: key);

  final Color _backgroundColor;
  final String _title;
  final Color _fontColor;
  final Function() _onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPress,
      style: TextButton.styleFrom(
        backgroundColor: _backgroundColor,
        padding: EdgeInsets.zero,
        primary: AppColors.kButtonOnClick,
      ),
      child: Container(
        height: 35.h,
        width: 365.w,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kIconBackgroundColor),
        ),
        child: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _fontColor,
          ),
        ),
      ),
    );
  }
}
