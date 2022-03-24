import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/enum.dart';
import 'package:flutter_adidas_clone/models/user.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredStatus => _registeredStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  set registeredStatus(Status value) {
    _registeredStatus = value;
  }

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
    print(response.data['err']);
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
}
