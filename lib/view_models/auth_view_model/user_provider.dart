import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  set user(User val) {
    _user = val;
    notifyListeners();
  }

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
