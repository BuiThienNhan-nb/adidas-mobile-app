import 'dart:convert';

class UserAddress {
  final String id;
  final String userId;
  final String receptionName;
  final String receptionPhoneNumber;
  final String address;
  final String country;
  UserAddress({
    required this.id,
    required this.userId,
    required this.receptionName,
    required this.receptionPhoneNumber,
    required this.address,
    required this.country,
  });

  UserAddress copyWith({
    String? id,
    String? userId,
    String? receptionName,
    String? receptionPhoneNumber,
    String? address,
    String? country,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      receptionName: receptionName ?? this.receptionName,
      receptionPhoneNumber: receptionPhoneNumber ?? this.receptionPhoneNumber,
      address: address ?? this.address,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'receptionName': receptionName});
    result.addAll({'receptionPhoneNumber': receptionPhoneNumber});
    result.addAll({'address': address});
    result.addAll({'country': country});

    return result;
  }

  factory UserAddress.fromMap(Map<String, dynamic> map) {
    return UserAddress(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      receptionName: map['receptionName'] ?? '',
      receptionPhoneNumber: map['receptionPhoneNumber'] ?? '',
      address: map['address'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddress.fromJson(String source) =>
      UserAddress.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAddress(id: $id, userId: $userId, receptionName: $receptionName, receptionPhoneNumber: $receptionPhoneNumber, address: $address, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAddress &&
        other.id == id &&
        other.userId == userId &&
        other.receptionName == receptionName &&
        other.receptionPhoneNumber == receptionPhoneNumber &&
        other.address == address &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        receptionName.hashCode ^
        receptionPhoneNumber.hashCode ^
        address.hashCode ^
        country.hashCode;
  }
}
