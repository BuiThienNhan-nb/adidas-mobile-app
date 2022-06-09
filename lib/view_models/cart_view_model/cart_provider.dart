import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';

class CartProvider extends ChangeNotifier {
  int _count = -1;
  int _itemCount = 5;
  List<Product> _listProduct = [];
  bool isContains = false;
  int _price = 0;

  int get count => _count;
  int get itemCount => _itemCount;
  int get price => _price;
  List<Product> get listProduct => _listProduct;
  set listProduct(List<Product> list) {
    _listProduct = list;
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _price -= product.price;
    _listProduct.remove(product);
    notifyListeners();
  }

  void addToCart(Product product) {
    if (_listProduct.contains(product)) {
    } else {
      _listProduct.add(product);
    }
    notifyListeners();
  }

  void sumPrice() {
    for (Product element in _listProduct) {
      _price += element.price;
    }
    notifyListeners();
  }

  increaseCart() {
    _count++;
    notifyListeners();
  }

  set itemCount(int value) {
    _itemCount = value;
    notifyListeners();
  }
}
