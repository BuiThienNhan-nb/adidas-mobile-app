// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_adidas_clone/models/product_category.dart';
import 'package:flutter_adidas_clone/models/product_type.dart';

class Product {
  final String id;
  final List<String> imageUrls;
  final String tag;
  final int price;
  final String name;
  bool isFavorite = false;
  final ProductType productType;
  final List<ProductCategory> productCategory;
  Product({
    required this.id,
    required this.imageUrls,
    required this.tag,
    required this.price,
    required this.name,
    required this.isFavorite,
    required this.productType,
    required this.productCategory,
  });

  Product copyWith({
    String? id,
    List<String>? imageUrls,
    String? tag,
    int? price,
    String? name,
    bool? isFavorite,
    ProductType? productType,
    List<ProductCategory>? productCategory,
  }) {
    return Product(
      id: id ?? this.id,
      imageUrls: imageUrls ?? this.imageUrls,
      tag: tag ?? this.tag,
      price: price ?? this.price,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      productType: productType ?? this.productType,
      productCategory: productCategory ?? this.productCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': imageUrls,
      'tag': tag,
      'price': price,
      'name': name,
      'isFavorite': isFavorite,
      'productType': productType.toMap(),
      'productCategory': productCategory.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      imageUrls: List<String>.from((map['images'] ?? [])),

      // imageUrls: List<String>.from((map['imageUrls'] as List<String>)) ?? [],
      tag: map['tag'] ?? '',
      price: map['price'] ?? '',
      name: map['name'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      productType: map['productType'] == null
          ? ProductType(id: '', name: 'load_error')
          : ProductType.fromMap(map['productType'] as Map<String, dynamic>),
      productCategory: map['productCategory'] == null
          ? []
          : List<ProductCategory>.from(
              (map['productCategory']).map<ProductCategory>(
                (x) => ProductCategory.fromMap(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, imageUrls: $imageUrls, tag: $tag, price: $price, name: $name, isFavorite: $isFavorite, productType: $productType, productCategory: $productCategory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        listEquals(other.imageUrls, imageUrls) &&
        other.tag == tag &&
        other.price == price &&
        other.name == name &&
        other.isFavorite == isFavorite &&
        other.productType == productType &&
        listEquals(other.productCategory, productCategory);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrls.hashCode ^
        tag.hashCode ^
        price.hashCode ^
        name.hashCode ^
        isFavorite.hashCode ^
        productType.hashCode ^
        productCategory.hashCode;
  }
}
