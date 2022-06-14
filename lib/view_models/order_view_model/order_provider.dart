import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';

import '../../configs/order_status.dart';
import '../../models/order.dart';
import '../../models/user_address.dart';

class OrderProvider extends ChangeNotifier {
  // : delete mock order data
  final Order _order = Order(
    id: 'mock_data',
    userId: '1',
    orderTime: DateTime.now(),
    userAddress: UserAddress(
      id: 'mock_data_1',
      userId: '1',
      receptionName: '',
      receptionPhoneNumber: '',
      address: '',
      country: '',
    ),
    paymentMethod: "",
    promotion: null,
    total: 0,
    // orderItems: AppMockData().orderItems,
    orderItems: [],
    orderStatus: AppOrderStatus.processing,
  );

  Order get order => _order;

  List<Order> _orders = [];

  List<Order> get orders => _orders;

  set orders(List<Order> orders) {
    _orders = orders;
    notifyListeners();
  }

  addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  /// Fake fetch order by user id
  List<Order> fetchOrdersByUserId(String userId) {
    /// Call from Repo
    return _orders.where((order) => order.userId == userId).toList();
  }

  updatePaymentMethod(String paymentMethod) {
    _order.paymentMethod = paymentMethod;
    notifyListeners();
  }

  deleteOrderItem(int index) {
    _order.orderItems.removeAt(index);
    notifyListeners();
  }

  addOrderItem(OrderItem orderItem) {
    _order.orderItems.add(orderItem);
    notifyListeners();
  }

  updateOrderItem(int index, OrderItem newValue) {
    _order.orderItems[index].copyWith(
      product: newValue.product.copyWith(
        id: newValue.product.id,
        imageUrls: newValue.product.imageUrls,
        name: newValue.product.name,
        price: newValue.product.price,
        tag: newValue.product.tag,
      ),
      quantity: newValue.quantity,
      size: newValue.size,
    );
    notifyListeners();
  }
}
