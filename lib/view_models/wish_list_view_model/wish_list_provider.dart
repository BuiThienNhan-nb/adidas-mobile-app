import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';

class WishListProvider extends ChangeNotifier {
  List<Product> _listWish = [];
  List<Product> get listWish => _listWish;
  set listWish(List<Product> list) {
    _listWish = list;
    notifyListeners();
  }

  bool _isFav = false;
  bool get isFav => _isFav;
  set isFav(bool isFav) {
    _isFav = isFav;
    notifyListeners();
  }

  // List<bool> _listbool = List.filled(_listWish.length, false);
  // List<bool> get listBool => _listbool;

  void disLike(Product product) {
    _listWish.remove(product);

    notifyListeners();
  }

  void like(Product product) {
    _listWish.add(product);
    notifyListeners();
  }
}
