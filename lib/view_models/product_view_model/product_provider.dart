import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _listProduct = [];
  List<Product> get listProduct => _listProduct;
  set listProduct(List<Product> value) {
    _listProduct = value;
    notifyListeners();
  }

  List<Product> get listProductOriginals =>
      _listProduct.where((e) => e.tag == 'ORIGINALS').toList();
  List<Product> get listProductRunning =>
      _listProduct.where((e) => e.tag == 'RUNNING').toList();

  List<Product> get listProductLifeStyle =>
      _listProduct.where((e) => e.tag == 'LIFE STYLE').toList();

  List<Product> get listProductSlides =>
      _listProduct.where((e) => e.tag == 'SLIDES').toList();

  List<Product> get listProductFootball =>
      _listProduct.where((e) => e.tag == 'FOOTBALL').toList();
  List<Product> get listProductGolf =>
      _listProduct.where((e) => e.tag == 'GOLF').toList();
  List<Product> get listProductBasketball =>
      _listProduct.where((e) => e.tag == 'BASKETBALL').toList();
  List<Product> get listProductNewArrivals =>
      _listProduct.where((e) => e.tag == 'NEW').toList();
}
