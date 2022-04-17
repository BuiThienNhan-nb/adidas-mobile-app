import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/login_screen/login_with_email/login_with_email_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_method_button.dart';
import 'package:flutter_adidas_clone/views/utils/widget/privacy_term_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _googleSignIn = GoogleSignIn();
    Future loginFaceBook() async {
      final LoginResult result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile
      // or FacebookAuth.i.login()
      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;
      } else {
        print(result.status);
        print(result.message);
      }
    }

    Future loginGoogle() async {
      final user = _googleSignIn.signIn();
      print(user);
    }

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
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
            onPress: loginFaceBook,
          ),
          //SizedBox(height: 3.h),
          AuthMethodButton(
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: AppSizes.navBarIconSize + 3,
              color: Colors.red.shade900,
            ),
            title: "Google",
            onPress: loginGoogle,
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
                    primary: AppColors.kButtonOnClick,
                  ),
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.kIconBackgroundColor,
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
