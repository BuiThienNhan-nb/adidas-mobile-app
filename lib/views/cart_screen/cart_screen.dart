import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/cart_item/w_cart_item.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/w_checkout_cart.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String _content = "Loading...";

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
          Divider(height: 3.h, color: AppColors.kIconBackgroundColor),

          /// Temp cart item
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => CartItem(
                product: Product(
                  image: 'assets/images/temp_sneaker.png',
                  tag: "LOW IN STOCK",
                  price: 5200000,
                  name: "ULTRABOOST 21 x PAREY SHOES",
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
