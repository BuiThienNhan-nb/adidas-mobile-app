import 'dart:convert';

class Product {
  final String? id;
  final String image;
  final String tag;
  final int price;
  final String name;

  Product({
    this.id,
    required this.image,
    required this.tag,
    required this.price,
    required this.name,
  });

  Product copyWith({
    String? id,
    String? image,
    String? tag,
    int? price,
    String? name,
  }) {
    return Product(
      id: id ?? this.id,
      image: image ?? this.image,
      tag: tag ?? this.tag,
      price: price ?? this.price,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'image': image});
    result.addAll({'tag': tag});
    result.addAll({'price': price});
    result.addAll({'name': name});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      image: map['image'] ?? '',
      tag: map['tag'] ?? '',
      price: map['price']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, image: $image, tag: $tag, price: $price, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.image == image &&
        other.tag == tag &&
        other.price == price &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        tag.hashCode ^
        price.hashCode ^
        name.hashCode;
  }
}
