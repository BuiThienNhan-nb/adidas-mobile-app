import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';

import '../../configs/order_status.dart';
import '../../models/order.dart';
import '../../models/user_address.dart';

class OrderProvider extends ChangeNotifier {
  // Order _oder = Order(
  //   id: "id",
  //   userId: "",
  //   orderTime: DateTime.now(),
  //   orderAddress: "05/66 Phan Đăng Lưu",
  //   paymentMethod: "Select payment Method",
  //   receptionName: "Bùi Thiện Nhân",
  //   receptionPhone: "0762796747",
  //   total: 17500000,
  // );

  /// TODO: delete mock order data
  Order _order = Order(
    id: 'mock_data',
    userId: '1',
    orderTime: DateTime.now(),
    userAddress: UserAddress(
      id: 'mock_data_1',
      userId: '1',
      receptionName: 'Bui Thien Nhan',
      receptionPhoneNumber: '0762796747',
      address: '05/66 Phan Đăng Lưu, TP Tuy Hòa, Phú Yên,',
      country: 'VietNam',
    ),
    paymentMethod: "Select payment method",
    promotionId: null,
    total: 17500000,
    orderItems: AppMockData().orderItems,
    orderStatus: AppOrderStatus.processing,
  );

  Order get order => _order;

  set order(Order val) {
    _order = val;
    notifyListeners();
  }

  updatePaymentMethod(String paymentMethod) {
    _order.paymentMethod = paymentMethod;
    notifyListeners();
  }
}
