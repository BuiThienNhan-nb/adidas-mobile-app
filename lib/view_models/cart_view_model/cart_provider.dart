import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _count = -1;
  int get count => _count;

  increaseCart() {
    _count++;
    notifyListeners();
  }
}
