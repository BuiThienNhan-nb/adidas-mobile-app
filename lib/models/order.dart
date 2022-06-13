// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_item.dart';
import 'promotion.dart';
import 'user_address.dart';

class Order {
  final String id;
  final String userId;
  final DateTime orderTime;
  UserAddress userAddress;
  String paymentMethod;
  Promotion? promotion;
  String orderStatus;
  List<OrderItem> orderItems;
  int total;
  Order({
    required this.id,
    required this.userId,
    required this.orderTime,
    required this.userAddress,
    required this.paymentMethod,
    this.promotion,
    required this.orderStatus,
    required this.orderItems,
    required this.total,
  });

  Order copyWith({
    String? id,
    String? userId,
    DateTime? orderTime,
    UserAddress? userAddress,
    String? paymentMethod,
    Promotion? promotion,
    String? orderStatus,
    List<OrderItem>? orderItems,
    int? total,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderTime: orderTime ?? this.orderTime,
      userAddress: userAddress ?? this.userAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      promotion: promotion ?? this.promotion,
      orderStatus: orderStatus ?? this.orderStatus,
      orderItems: orderItems ?? this.orderItems,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'orderTime': orderTime.millisecondsSinceEpoch,
      'userAddress': userAddress.toMap(),
      'paymentMethod': paymentMethod,
      'promotion': promotion?.toMap(),
      'orderStatus': orderStatus,
      'orderItems': orderItems.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      orderTime: map['orderTime'] == null
          ? DateTime.now()
          : DateTime.parse(map['orderTime']),
      userAddress:
          UserAddress.fromMap(map['userAddress'] as Map<String, dynamic>),
      paymentMethod: (map['paymentMethod'] ?? '') as String,
      promotion: map['promotion'] != null
          ? Promotion.fromMap(map['promotion'] as Map<String, dynamic>)
          : null,
      orderStatus: (map['orderStatus'] ?? '') as String,
      orderItems: map['orderItems'] == null
          ? []
          : List<OrderItem>.from(
              map['orderItems'].map<OrderItem>(
                (x) => Order.fromMap(x as Map<String, dynamic>),
              ),
            ),
      total: (map['total'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, orderTime: $orderTime, userAddress: $userAddress, paymentMethod: $paymentMethod, promotion: $promotion, orderStatus: $orderStatus, orderItems: $orderItems, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.userId == userId &&
        other.orderTime == orderTime &&
        other.userAddress == userAddress &&
        other.paymentMethod == paymentMethod &&
        other.promotion == promotion &&
        other.orderStatus == orderStatus &&
        listEquals(other.orderItems, orderItems) &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        orderTime.hashCode ^
        userAddress.hashCode ^
        paymentMethod.hashCode ^
        promotion.hashCode ^
        orderStatus.hashCode ^
        orderItems.hashCode ^
        total.hashCode;
  }
}
