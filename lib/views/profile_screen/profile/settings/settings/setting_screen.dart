import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/address_book_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/event_sceen/event_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/help_screen/help_cus_service_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/imprint_screen/imprint_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/personal_screen/personal_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_option_widget.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/term_privacy_screen/privacy_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/term_privacy_screen/term_screen.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  logout() {
    // Logout success
    setState(() => context.read<AuthProvider>().isLoading = true);
    Future.delayed(const Duration(seconds: 2)).then(
      (val) {
        setState(() => context.read<AuthProvider>().isLogin = false);
        setState(() => context.read<AuthProvider>().isLoading = false);
        Navigator.of(context)
          ..popUntil(ModalRoute.withName(HomeScreen.id))
          ..push(
            CupertinoPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        SettingOption(
          content: "PERSONAL INFORMATION",
          function: () => Navigator.pushNamed(
            context,
            PersonalScreen.id,
          ),
        ),
        SettingOption(
          content: "ADDRESS BOOK",
          function: () => Navigator.pushNamed(
            context,
            AddressBookScreen.id,
          ),
        ),
        SettingOption(
          content: "MY EVENTS",
          function: () => Navigator.pushNamed(
            context,
            MyEventScreen.id,
          ),
        ),
        SettingOption(
          content: "HELP & CUSTOMER SERVICE",
          function: () => Navigator.pushNamed(
            context,
            HelpCustomerServiceScreen.id,
          ),
        ),
        SettingOption(
          content: "TERMS AND CONDITIONS",
          function: () => Navigator.pushNamed(
            context,
            TermsConditionScreen.id,
          ),
        ),
        SettingOption(
          content: "PRIVACY POLICY",
          function: () => Navigator.pushNamed(
            context,
            PrivacyPolicyScreen.id,
          ),
        ),
        SettingOption(
          content: "IMPRINT",
          function: () => Navigator.pushNamed(
            context,
            ImprintScreen.id,
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          child: MyTextButton(
            function: logout,
            content: "LOG OUT",
            isLoading: context.read<AuthProvider>().isLoading,
          ),
        ),
      ],
    );
  }
}
