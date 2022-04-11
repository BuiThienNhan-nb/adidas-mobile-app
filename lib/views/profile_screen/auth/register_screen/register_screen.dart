import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_method_button.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/register_screen/register_with_email/register_with_email.dart';
import 'package:flutter_adidas_clone/views/utils/widget/privacy_term_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/widget/span_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void popUpTerm() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "term.md"),
        );
    void popUpPrivacy() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "privacy.md"),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text(
          "REGISTER",
          style: AppStyles.titleTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
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
                builder: (context) => const RegisterWithEmail(),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("By clicking REGISTER, I: "),
                TermSpanText(
                  contentText1:
                      "\t\t * agree that I have read, understood and accepted the ",
                  linkText1: "Privacy Notice",
                  contentText2: " and ",
                  linkText2: "Terms and Conditions",
                  onTap1: popUpPrivacy,
                  onTap2: popUpTerm,
                ),
                TermSpanText(
                  contentText1:
                      "\t\t * hereby consent to the use of my personal data for marketing and promotional purposes as set out in the adidas ",
                  linkText1: "Privacy Notice",
                  contentText2: "",
                  linkText2: "",
                  onTap1: popUpPrivacy,
                  onTap2: () {},
                ),
                const Text(
                    "If you do not agree to any of the above, please do not click REGISTER and exit the App!"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
