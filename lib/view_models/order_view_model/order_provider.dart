import 'package:flutter/cupertino.dart';

import '../../models/order.dart';

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

  late Order _order;

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
