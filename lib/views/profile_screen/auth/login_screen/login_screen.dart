import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_method_button.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/login_screen/login_with_email/login_with_email_screen.dart';
import 'package:flutter_adidas_clone/views/utils/widget/privacy_term_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "LOGIN",
          style: AppStyles.titleTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthMethodButton(
            icon: FaIcon(
              FontAwesomeIcons.facebookSquare,
              size: AppSizes.navBarIconSize + 3,
              color: Colors.indigo.shade800,
            ),
            title: "Facebook",
            onPress: () {},
          ),
          //SizedBox(height: 3.h),
          AuthMethodButton(
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: AppSizes.navBarIconSize + 3,
              color: Colors.red.shade900,
            ),
            title: "Google",
            onPress: () {},
          ),
          //SizedBox(height: 3.h),
          AuthMethodButton(
            icon: const FaIcon(
              FontAwesomeIcons.envelope,
              size: AppSizes.navBarIconSize + 3,
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
                    primary: AppColors.buttonOnClick,
                  ),
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.iconBackgroundColor,
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
