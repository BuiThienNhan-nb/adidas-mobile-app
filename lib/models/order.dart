import 'dart:convert';

class Order {
  final String id;
  final String userId;
  final DateTime orderTime;
  String orderAddress;
  String paymentMethod;
  String receptionName;
  String receptionPhone;
  String? promotionId;
  int total;
  Order({
    required this.id,
    required this.userId,
    required this.orderTime,
    required this.orderAddress,
    required this.paymentMethod,
    required this.receptionName,
    required this.receptionPhone,
    this.promotionId,
    required this.total,
  });

  Order copyWith({
    String? id,
    String? userId,
    DateTime? orderTime,
    String? orderAddress,
    String? paymentMethod,
    String? receptionName,
    String? receptionPhone,
    String? promotionId,
    int? total,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderTime: orderTime ?? this.orderTime,
      orderAddress: orderAddress ?? this.orderAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      receptionName: receptionName ?? this.receptionName,
      receptionPhone: receptionPhone ?? this.receptionPhone,
      promotionId: promotionId ?? this.promotionId,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'orderTime': orderTime.millisecondsSinceEpoch});
    result.addAll({'orderAddress': orderAddress});
    result.addAll({'paymentMethod': paymentMethod});
    result.addAll({'receptionName': receptionName});
    result.addAll({'receptionPhone': receptionPhone});
    if (promotionId != null) {
      result.addAll({'promotionId': promotionId});
    }
    result.addAll({'total': total});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      orderTime: DateTime.fromMillisecondsSinceEpoch(map['orderTime']),
      orderAddress: map['orderAddress'] ?? '',
      paymentMethod: map['paymentMethod'] ?? '',
      receptionName: map['receptionName'] ?? '',
      receptionPhone: map['receptionPhone'] ?? '',
      promotionId: map['promotionId'],
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, orderTime: $orderTime, orderAddress: $orderAddress, paymentMethod: $paymentMethod, receptionName: $receptionName, receptionPhone: $receptionPhone, promotionId: $promotionId, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.orderTime == orderTime &&
        other.orderAddress == orderAddress &&
        other.paymentMethod == paymentMethod &&
        other.receptionName == receptionName &&
        other.receptionPhone == receptionPhone &&
        other.promotionId == promotionId &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        orderTime.hashCode ^
        orderAddress.hashCode ^
        paymentMethod.hashCode ^
        receptionName.hashCode ^
        receptionPhone.hashCode ^
        promotionId.hashCode ^
        total.hashCode;
  }
}
