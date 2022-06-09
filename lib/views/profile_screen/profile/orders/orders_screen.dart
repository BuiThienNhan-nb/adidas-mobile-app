import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/orders/order_history/order_history_item.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'empty_order_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<OrderProvider>().orders.isNotEmpty
        ? const EmptyOrderScreen()
        :
        // template screen when there's something in user cart
        OrderHistoryItem(order: context.read<OrderProvider>().order);
  }
}
