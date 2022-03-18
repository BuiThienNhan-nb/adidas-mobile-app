import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoginWithEmailScreen = false;
  bool get isLoginWithEmailScreen => _isLoginWithEmailScreen;

  setIsLoginWithEmailScreen(bool flag) {
    _isLoginWithEmailScreen = flag;
    notifyListeners();
  }
}
