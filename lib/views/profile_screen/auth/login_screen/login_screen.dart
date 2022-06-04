import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/size.dart';
import '../../../../configs/style.dart';
import '../../../../models/user.dart';
import '../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../view_models/auth_view_model/user_provider.dart';
import '../../../home_screen.dart';
import '../../../utils/widget/privacy_term_dialog.dart';
import '../widget/auth_method_button.dart';
import 'login_with_email/login_with_email_screen.dart';

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
        log('${result.status}');
        log('${result.message}');
      }
    }

    Future loginGoogle() async {
      _googleSignIn.signIn().then(
        (value) {
          context.read<AuthProvider>().loginMethod =
              LoginMethod.google.toString();
          log(value.toString());
          log(context.read<AuthProvider>().loginMethod);
          context.read<UserProvider>().user = User(
            id: '2',
            isVerifiedEmail: true,
            fullName: value?.displayName ?? 'None',
            dateOfBirth: DateTime.now(),
            phoneNumber: '0123456789',
            email: value?.email ?? 'sample_email@gmail.com',
          );
        },
        onError: (_) => log('LOGIN FAILURE'),
      ).then(
        (value) {
          context.read<AuthProvider>().isLogin = true;
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.id,
            (route) => false,
          );
        },
      );
      // log(user.toString());
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
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
                    primary: AppColors.nobelColor,
                  ),
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.blackColor,
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
