// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Promotion {
  String id;
  final String name;
  final String description;
  final DateTime expiredDate;
  final double discount;
  Promotion({
    required this.id,
    required this.name,
    required this.description,
    required this.expiredDate,
    required this.discount,
  });

  Promotion copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? expiredDate,
    double? discount,
  }) {
    return Promotion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      expiredDate: expiredDate ?? this.expiredDate,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'expiredDate': expiredDate.millisecondsSinceEpoch,
      'discount': discount,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      expiredDate:
          DateTime.fromMillisecondsSinceEpoch((map['expiredDate'] ?? 0) as int),
      discount: (map['discount'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Promotion.fromJson(String source) =>
      Promotion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Promotion(id: $id, name: $name, description: $description, expiredDate: $expiredDate, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Promotion &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.expiredDate == expiredDate &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        expiredDate.hashCode ^
        discount.hashCode;
  }
}
