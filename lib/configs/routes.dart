import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/auth_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/profile_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/address_book_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/event_sceen/event_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/help_screen/help_cus_service_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/imprint_screen/imprint_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/personal_screen/forgot_password.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/personal_screen/personal_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/term_privacy_screen/privacy_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/term_privacy_screen/term_screen.dart';

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  Route<dynamic> onGenerateRoute(RouteSettings _settings) {
    switch (_settings.name) {
      case HomeScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AuthScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const AuthScreen(),
        );
      case ProfileScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case PersonalScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const PersonalScreen(),
        );
      case ForgotPasswordScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case AddressBookScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const AddressBookScreen(),
        );
      case MyEventScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const MyEventScreen(),
        );
      case TermsConditionScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const TermsConditionScreen(),
        );
      case PrivacyPolicyScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case ImprintScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const ImprintScreen(),
        );
      case HelpCustomerServiceScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const HelpCustomerServiceScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
