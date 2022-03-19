import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLogin(bool val) {
    _isLogin = val;
    notifyListeners();
  }

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
