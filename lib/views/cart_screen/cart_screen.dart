import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/palette.dart';
import '../../models/order_item.dart';
import '../utils/widget/app_bar.dart';
import '../utils/widget/w_options_mbs.dart';
import 'utils/cart_item/w_cart_item.dart';
import 'utils/checkout/w_checkout_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;

  @override
  Widget build(BuildContext context) {
    List<OrderItem> orderItems =
        context.watch<OrderProvider>().order.orderItems;

    onDeleteItem(int index) {
      log('[ORDER ITEM] delete index: $index - name: ${orderItems[index].product.name}');
      context.read<OrderProvider>().deleteOrderItem(index);
    }

    onDotsClick(BuildContext context, int index) {
      log('dots clicked!');
      showModalBottomSheet<dynamic>(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: 180.h,
          width: double.infinity,
          child: OptionsModalBottomSheet(
            title: 'OPTIONS',
            widgets: [
              buildDotsWidget(
                Image.asset('assets/icons/heart_icon_light.png'),
                "Move to wishlist",
                () {
                  log('[DOT OPTION] add to wishlist');
                  Navigator.of(context).pop();
                },
              ),
              // "Remove from Wishlist": Image.asset('assets/icons/trash_icon.png'),
              buildDotsWidget(
                Image.asset('assets/icons/trash_icon.png'),
                "Remove from cart",
                () {
                  onDeleteItem(index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOPPING CART",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text("${orderItems.length}   P R O D U C T S"),
          ),
          SizedBox(height: 12.h),
          Divider(height: 3.h, color: AppColors.blackColor),

          /// Temp cart list
          Expanded(
            child: Consumer<OrderProvider>(
              builder: (_, value, __) => ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) => CartItem(
                  orderItem: orderItems[index],
                  appContext: appContext,
                  isWishList: false,
                  onDotsClick: () => onDotsClick(context, index),
                  onDelete: () => onDeleteItem(index),
                ),
              ),
            ),
          ),
          Consumer<OrderProvider>(
            builder: (_, orderProvider, ___) => CheckoutCartContainer(
              total: orderProvider.order.total,
            ),
          ),
        ],
      ),
    );
  }
}
