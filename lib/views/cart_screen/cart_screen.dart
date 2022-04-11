import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/cart_screen/empty_cart_widget.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/w_cart_item.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOPPING CART",
      ),
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
          CartItem(
            product: Product(
              image: 'assets/images/temp_sneaker.png',
              tag: "LOW IN STOCK",
              price: 5200000,
              name: "ULTRABOOST 21 x PAREY SHOES",
            ),
          ),
        ],
      ),
    );
  }
}
