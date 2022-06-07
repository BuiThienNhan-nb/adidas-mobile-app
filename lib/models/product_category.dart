import 'dart:convert';

class ProductCategory {
  final String id;
  final String imageUrl;
  final String name;
  ProductCategory({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  ProductCategory copyWith({
    String? id,
    String? imageUrl,
    String? name,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'name': name});

    return result;
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) =>
      ProductCategory.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductCategory(id: $id, imageUrl: $imageUrl, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCategory &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ name.hashCode;
}
