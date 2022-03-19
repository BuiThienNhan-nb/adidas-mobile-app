import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_method_button.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/login_screen/login_with_email/login_with_email_screen.dart';
import 'package:flutter_adidas_clone/views/utils/widget/privacy_term_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "LOGIN",
          style: AppStyle.titleTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          AuthMethodButton(
            icon: FaIcon(
              FontAwesomeIcons.facebookSquare,
              size: AppSize.navBarIconSize + 3,
              color: Colors.indigo.shade800,
            ),
            title: "Facebook",
            onPress: () {},
          ),
          //SizedBox(height: 3.h),
          AuthMethodButton(
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: AppSize.navBarIconSize + 3,
              color: Colors.red.shade900,
            ),
            title: "Google",
            onPress: () {},
          ),
          //SizedBox(height: 3.h),
          AuthMethodButton(
            icon: const FaIcon(
              FontAwesomeIcons.envelope,
              size: AppSize.navBarIconSize + 3,
            ),
            title: "Email",
            onPress: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const LoginWithEmail(),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Text("By signing up you agree to our "),
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) =>
                        PrivacyTermDialog(mdFileName: "term.md"),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                    primary: AppColor.kButtonOnClick,
                  ),
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColor.kIconBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
