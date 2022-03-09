import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/pages/home_screen.dart';
import 'package:flutter_adidas_clone/pages/profile_screen/auth_screen.dart';

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
          builder: (_) => HomeScreen(),
        );
      case AuthScreen.id:
        return CupertinoPageRoute(
          builder: (_) => const AuthScreen(),
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
