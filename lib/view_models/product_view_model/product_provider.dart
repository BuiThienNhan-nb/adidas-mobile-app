import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/models/product_category.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _listProduct = [];
  List<Product> get listProduct => _listProduct;
  set listProduct(List<Product> value) {
    _listProduct = value;
    notifyListeners();
  }

  List<Product> get listProductOriginals =>
      _listProduct.where((e) => e.tag == 'ORIGINALS').toList();

  List<Product> getProductByCategory(ProductCategory productCategory) {
    return _listProduct
        .where(
          (product) => product.productCategory.any(
            (category) => category.name.compareTo(productCategory.name) == 0,
          ),
        )
        .toList();
  }

  // List<Product> getProductByName(String productName) =>
  // _listProduct
  //     .where((product) =>
  //         product.name.toLowerCase().contains(productName.toLowerCase().trim()))
  //     .toList();

  Future<List<Product>> getProductByName(String productName) async {
    await Future.delayed(const Duration(seconds: 2));
    return AppMockData()
        .ultraBoost
        .where((product) => product.name
            .toLowerCase()
            .trim()
            .contains(productName.toLowerCase().trim()))
        .toList();
  }

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
