// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Store {
  final String id;
  final String name;
  final String address;
  final int openTime;
  final int closeTime;
  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.openTime,
    required this.closeTime,
  });

  Store copyWith({
    String? id,
    String? name,
    String? address,
    int? openTime,
    int? closeTime,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      openTime: map['openTime'] as int,
      closeTime: map['closeTime'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Store(id: $id, name: $name, address: $address, openTime: $openTime, closeTime: $closeTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Store &&
        other.id == id &&
        other.name == name &&
        other.address == address &&
        other.openTime == openTime &&
        other.closeTime == closeTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        openTime.hashCode ^
        closeTime.hashCode;
  }
}
