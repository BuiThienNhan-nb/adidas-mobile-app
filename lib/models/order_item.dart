// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_adidas_clone/models/product.dart';

class OrderItem {
  final Product product;
  double size;
  int quantity;
  int total;
  OrderItem({
    required this.product,
    required this.size,
    required this.quantity,
    required this.total,
  });

  OrderItem copyWith({
    Product? product,
    double? size,
    int? quantity,
    int? total,
  }) {
    return OrderItem(
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'size': size,
      'quantity': quantity,
      'total': total,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      size: map['size'] as double,
      quantity: map['quantity'] as int,
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderItem(product: $product, size: $size, quantity: $quantity, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderItem &&
        other.product == product &&
        other.size == size &&
        other.quantity == quantity &&
        other.total == total;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        size.hashCode ^
        quantity.hashCode ^
        total.hashCode;
  }
}
