import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../service/data_repository.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool _isLoading = false;
  late String _loginMethod;

  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;
  String get loginMethod => _loginMethod;

  set isLogin(bool val) {
    _isLogin = val;
    notifyListeners();
  }

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  set loginMethod(String value) {
    _loginMethod = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> fetchLogin(String email, String passWord) async {
    // Map<String, dynamic> result;
    Response response = await DataRepository().login(email, passWord);
    if (response.statusCode == 200) {
      notifyListeners();
      return {
        'status': true,
        'message': 'Successfully loggedIn',
        'data': response.data
      };
    } else {
      notifyListeners();
      return {
        'status': false,
        'message': 'Unsuccessful loggedIn',
        'data': response.data
      };
    }
  }

  Future<Map<String, dynamic>> register(String email, String passWord) async {
    Response response = await DataRepository().register(email, passWord);
    if (response.statusCode == 200) {
      notifyListeners();
      return {
        'status': true,
        'message': 'Successfully register',
        'data': response.data
      };
    } else {
      notifyListeners();
      return {
        'status': false,
        'message': 'Unsuccessful register',
        'data': response.data
      };
    }
  }

  Future<Map<String, dynamic>> checkEmail(String id) async {
    Response response = await DataRepository().checkEmail(id);
    if (response.statusCode == 200) {
      notifyListeners();
      return {
        'status': true,
        'message': 'Successfully check mail',
        'data': response.data
      };
    } else {
      notifyListeners();
      return {
        'status': false,
        'message': 'Unsuccessful check mail',
        'data': response.data
      };
    }
  }
}

enum LoginMethod {
  facebook,
  google,
  email,
}
