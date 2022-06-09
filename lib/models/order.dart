import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';

class Order {
  final String id;
  final String userId;
  final DateTime orderTime;
  UserAddress userAddress;
  String paymentMethod;
  String? promotionId;
  String orderStatus;
  List<OrderItem> orderItems;
  int total;
  Order({
    required this.id,
    required this.userId,
    required this.orderTime,
    required this.userAddress,
    required this.paymentMethod,
    this.promotionId,
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
    String? promotionId,
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
      promotionId: promotionId ?? this.promotionId,
      orderStatus: orderStatus ?? this.orderStatus,
      orderItems: orderItems ?? this.orderItems,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'orderTime': orderTime.millisecondsSinceEpoch});
    result.addAll({'userAddress': userAddress.toMap()});
    result.addAll({'paymentMethod': paymentMethod});
    if (promotionId != null) {
      result.addAll({'promotionId': promotionId});
    }
    result.addAll({'orderStatus': orderStatus});
    result.addAll({'orderItems': orderItems.map((x) => x.toMap()).toList()});
    result.addAll({'total': total});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      orderTime: DateTime.fromMillisecondsSinceEpoch(map['orderTime']),
      userAddress: UserAddress.fromMap(map['userAddress']),
      paymentMethod: map['paymentMethod'] ?? '',
      promotionId: map['promotionId'],
      orderStatus: map['orderStatus'] ?? '',
      orderItems: List<OrderItem>.from(
          map['orderItems']?.map((x) => OrderItem.fromMap(x))),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, orderTime: $orderTime, userAddress: $userAddress, paymentMethod: $paymentMethod, promotionId: $promotionId, orderStatus: $orderStatus, orderItems: $orderItems, total: $total)';
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
        other.promotionId == promotionId &&
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
        promotionId.hashCode ^
        orderStatus.hashCode ^
        orderItems.hashCode ^
        total.hashCode;
  }
}
