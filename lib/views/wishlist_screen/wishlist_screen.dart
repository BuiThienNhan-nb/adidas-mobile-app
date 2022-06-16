import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/views/utils/widget/w_options_mbs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/palette.dart';
import '../../view_models/order_view_model/order_provider.dart';
import '../cart_screen/utils/cart_item/w_cart_item.dart';
import '../utils/widget/app_bar.dart';
import 'w_filter_modal_bottom_sheet.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;
  Filter filterOption = Filter.recentlyAdded;

  @override
  Widget build(BuildContext context) {
    List<OrderItem> orderItems =
        context.watch<OrderProvider>().order.orderItems ?? [];

    showFilterModalBottomSheet() {
      showModalBottomSheet<dynamic>(
        context: appContext,
        isScrollControlled: true,
        builder: (_) => SizedBox(
          height: 240.h,
          width: double.infinity,
          child: FilterModalBottomSheet(
            currentFilter: filterOption,
            callback: (newVal) {
              filterOption = newVal;
              log('[FILTER] filter option: $filterOption, callbackVal: $newVal');
              // Navigator.of(appContext).pop();
            },
          ),
        ),
      );
    }

    onDeleteItem(int index) {
      log('[ORDER ITEM] from wishlist, increase quantity index: $index - name: ${orderItems[index].product.name}');
      orderItems[index].quantity = 10;
      context.read<OrderProvider>().updateOrderItem(index, orderItems[index]);
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
                Image.asset('assets/icons/cart_add_icon_light.png'),
                "Add to cart",
                () {
                  log('[DOT OPTION] add to cart');
                  Navigator.of(context).pop();
                },
              ),
              // "Remove from Wishlist": Image.asset('assets/icons/trash_icon.png'),
              buildDotsWidget(
                Image.asset('assets/icons/trash_icon.png'),
                "Remove from Wishlist",
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
        title: "WISHLIST",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.w),
              Text("${orderItems.length}   P R O D U C T S"),
              const Spacer(),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: showFilterModalBottomSheet,
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Image.asset(
                    'assets/icons/filter_icon.png',
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(height: 3.h, color: AppColors.blackColor),

          /// Temp wishlist list
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) => CartItem(
                orderItem: orderItems[index],
                appContext: appContext,
                isWishList: true,
                onDotsClick: () => onDotsClick(context, index),
                onDelete: () => onDeleteItem(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
