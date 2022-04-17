import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool _isLoading = false;

  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;

  set isLogin(bool val) {
    _isLogin = val;
    notifyListeners();
  }

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<Map<String, dynamic>> fetchLogin(String email, String passWord) async {
    var result;
    Response response = await DataRepository().login(email, passWord);
    if (response.statusCode == 200) {
      notifyListeners();
      return result = {
        'status': true,
        'message': 'Successfully loggedIn',
        'data': response.data
      };
    } else {
      notifyListeners();
      return result = {
        'status': false,
        'message': 'Unsuccessful loggedIn',
        'data': response.data
      };
    }
  }

  Future<Map<String, dynamic>> register(String email, String passWord) async {
    var result;
    Response response = await DataRepository().register(email, passWord);
    if (response.statusCode == 200) {
      notifyListeners();
      return result = {
        'status': true,
        'message': 'Successfully register',
        'data': response.data
      };
    } else {
      notifyListeners();
      return result = {
        'status': false,
        'message': 'Unsuccessful register',
        'data': response.data
      };
    }
  }
}
