import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'product_category.dart';

class ProductType {
  final String id;
  final String name;
  final List<ProductCategory>? categories;
  ProductType({
    required this.id,
    required this.name,
    this.categories,
  });

  ProductType copyWith({
    String? id,
    String? name,
    List<ProductCategory>? categories,
  }) {
    return ProductType(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({
      'categories': categories == null
          ? [].map((x) => x.toMap()).toList()
          : categories!.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory ProductType.fromMap(Map<String, dynamic> map) {
    return ProductType(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      categories: List<ProductCategory>.from(
          map['categories']?.map((x) => ProductCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductType.fromJson(String source) =>
      ProductType.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductType(id: $id, name: $name, categories: $categories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductType &&
        other.id == id &&
        other.name == name &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ categories.hashCode;
}
