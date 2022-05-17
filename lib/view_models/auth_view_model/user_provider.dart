import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../service/data_repository.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  late bool _isStepOneRegister = false;

  User get user => _user;
  bool get isStepOneRegister => _isStepOneRegister;
  set user(User val) {
    _user = val;
    _isStepOneRegister = true;
    notifyListeners();
  }

  setUser(User user) {
    _user = user;
    _isStepOneRegister = true;

    notifyListeners();
  }

  Future<Map<String, dynamic>> updateUserInfor(
      String id, String fullName, String dateOfBirth) async {
    Response response =
        await DataRepository().updateUserInfor(id, fullName, dateOfBirth);
    if (response.statusCode == 200) {
      notifyListeners();
      return {
        'status': true,
        'message': 'Successfully update infor',
        'data': response.data
      };
    } else {
      notifyListeners();
      return {
        'status': false,
        'message': 'Unsuccessful update infor',
        'data': response.data
      };
    }
  }

  Future<Map<String, dynamic>> getUserById(String id) async {
    Response response = await DataRepository().getUserById(id);
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
