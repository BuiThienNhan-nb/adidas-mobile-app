import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/palette.dart';
import '../utils/widget/app_bar.dart';
import 'utils/cart_item/w_cart_item.dart';
import 'utils/checkout/w_checkout_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;
  final Map<String, Widget> optionItems = {
    "Move to wishlist": Image.asset('assets/icons/heart_icon_light.png'),
    "Remove from cart": Image.asset('assets/icons/trash_icon.png'),
  };

  @override
  Widget build(BuildContext context) {
    //String _content = "Loading...";
    log('[CART SCREEN] init');

    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOPPING CART",
      ),

      /// Empty cart widget show when cart quantity == 0
      // body: Container(
      //   color: Colors.white,
      //   child: const EmptyCartWidget(),
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Text("5   P R O D U C T S"),
          ),
          SizedBox(height: 12.h),
          Divider(height: 3.h, color: AppColors.blackColor),

          /// Temp cart item
          Expanded(
            child: Consumer<OrderProvider>(
              builder: (_, value, __) => ListView.builder(
                itemCount:
                    context.read<OrderProvider>().order.orderItems.length,
                itemBuilder: (context, index) => CartItem(
                  // product: Product(
                  //   imageUrl: ['assets/images/temp_sneaker.png'],
                  //   tag: "LOW IN STOCK",
                  //   price: 5200000,
                  //   name: "ULTRABOOST 21 x PAREY SHOES",
                  // ),
                  orderItem:
                      context.read<OrderProvider>().order.orderItems[index],
                  appContext: appContext,
                  isWishList: false,
                  optionItems: optionItems,
                ),
              ),
            ),
          ),
          const CheckoutCartContainer(total: 17500000),
        ],
      ),
    );
  }
}
