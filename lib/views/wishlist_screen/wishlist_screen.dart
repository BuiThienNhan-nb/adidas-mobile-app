import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/wishlist_screen/w_filter_modal_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';
import '../../models/product.dart';
import '../cart_screen/utils/cart_item/w_cart_item.dart';
import '../utils/widget/app_bar.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;
  final Map<String, Widget> optionItems = {
    "Add to cart": Image.asset('assets/icons/heart_icon_light.png'),
    "Remove from Wishlist": Image.asset('assets/icons/trash_icon.png'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "WISHLIST",
      ),

      // body: Container(
      //   color: Colors.white,
      //   child: const EmptyListWidget(),
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.w),
              const Text("5   P R O D U C T S"),
              const Spacer(),
              Material(
                child: InkWell(
                  onTap: () => showFilterModalBottomSheet(appContext),
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Image.asset(
                      'assets/icons/filter_icon.png',
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(height: 3.h, color: AppColors.iconBackgroundColor),

          /// Temp cart item
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => CartItem(
                product: Product(
                  imageUrl: ['assets/images/temp_sneaker.png'],
                  tag: "LOW IN STOCK",
                  price: 5200000,
                  name: "ULTRABOOST 21 x PAREY SHOES",
                ),
                appContext: appContext,
                isWishList: true,
                optionItems: optionItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showFilterModalBottomSheet(BuildContext context) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    builder: (_) => SizedBox(
      height: 240.h,
      width: double.infinity,
      child: const FilterModalBottomSheet(),
    ),
  );
}
