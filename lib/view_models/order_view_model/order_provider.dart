import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/models/order.dart';

class OrderProvider extends ChangeNotifier {
  Order _oder = Order(
    id: "id",
    userId: "",
    orderTime: DateTime.now(),
    orderAddress: "05/66 Phan Đăng Lưu",
    paymentMethod: "Select payment Method",
    receptionName: "Bùi Thiện Nhân",
    receptionPhone: "0762796747",
    total: 17500000,
  );

  Order get order => _oder;

  set order(Order val) {
    _oder = val;
    notifyListeners();
  }

  updatePaymentMethod(String paymentMethod) {
    _oder.paymentMethod = paymentMethod;
    notifyListeners();
  }
}
