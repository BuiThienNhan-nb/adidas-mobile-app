import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _count = -1;
  int _itemCount = 5;

  int get count => _count;
  int get itemCount => _itemCount;

  increaseCart() {
    _count++;
    notifyListeners();
  }

  set itemCount(int value) {
    _itemCount = value;
    notifyListeners();
  }
}
