import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/orders/order_history/order_history_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'empty_order_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.watch<OrderProvider>().orders.isNotEmpty
        ? const EmptyOrderScreen()
        : ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              color: AppColors.aliceBlueColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.w),
                child: Container(
                  color: AppColors.whiteColor,
                  child: OrderHistoryItem(
                      order: context.watch<OrderProvider>().order),
                ),
              ),
            ),
          );
    // OrderHistoryItem(order: context.read<OrderProvider>().order);
  }
}
