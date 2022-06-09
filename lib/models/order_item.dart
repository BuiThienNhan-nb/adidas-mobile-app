import 'dart:convert';

import 'package:flutter_adidas_clone/models/product.dart';

class OrderItem {
  final Product product;
  double size;
  int quantity;
  OrderItem({
    required this.product,
    required this.size,
    required this.quantity,
  });

  OrderItem copyWith({
    Product? product,
    double? size,
    int? quantity,
  }) {
    return OrderItem(
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'product': product.toMap()});
    result.addAll({'size': size});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      product: Product.fromMap(map['product']),
      size: map['size']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderItem(product: $product, size: $size, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderItem &&
        other.product == product &&
        other.size == size &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ size.hashCode ^ quantity.hashCode;
}
