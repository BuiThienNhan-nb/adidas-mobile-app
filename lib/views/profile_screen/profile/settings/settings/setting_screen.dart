import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../view_models/auth_view_model/user_provider.dart';
import '../../../../home_screen.dart';
import '../../../../utils/button/my_text_button.dart';
import 'address_screen/address_book_screen.dart';
import 'event_sceen/event_screen.dart';
import 'help_screen/help_cus_service_screen.dart';
import 'imprint_screen/imprint_screen.dart';
import 'personal_screen/personal_screen.dart';
import 'setting_option_widget.dart';
import 'term_privacy_screen/privacy_screen.dart';
import 'term_privacy_screen/term_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  logout() {
    setState(() => context.read<AuthProvider>().isLoading = true);
    switch (context.read<AuthProvider>().loginMethod) {
      case 'LoginMethod.google':
        GoogleSignIn().signOut().then(
          (value) {
            context.read<UserProvider>().user = User(
              id: 'id',
              fullName: 'fullName',
              isVerifiedEmail: false,
              dateOfBirth: DateTime.now(),
              phoneNumber: 'phoneNumber',
              email: 'sample_email@gmail.com',
            );
            setState(() => context.read<AuthProvider>().isLogin = false);
            setState(() => context.read<AuthProvider>().isLoading = false);
            Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.id,
              (route) => false,
            );
          },
        );
        break;
      default:
        Future.delayed(const Duration(seconds: 2)).then(
          (val) {
            setState(() => context.read<AuthProvider>().isLogin = false);
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
