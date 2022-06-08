import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/format.dart';
import '../../../../configs/palette.dart';
import '../../../../configs/size.dart';
import '../../../../configs/style.dart';
import '../../../utils/widget/w_options_mbs.dart';
import 'w_cart_item_save_btn.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.orderItem,
    required this.appContext,
    required this.optionItems,
    required this.isWishList,
  }) : super(key: key);

  final OrderItem orderItem;
  final BuildContext appContext;
  final Map<String, Widget> optionItems;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    void dotsOnClick() {
      log('dots clicked!');
      showModalBottomSheet<dynamic>(
        context: appContext,
        isScrollControlled: true,
        builder: (_) => SizedBox(
          height: 180.h,
          width: double.infinity,
          child: OptionsModalBottomSheet(
            title: 'OPTIONS',
            optionItems: optionItems,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.aliceBlueColor,
          height: 191.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image.asset(
              //   orderItem.product.imageUrl.first,
              //   height: 190.h,
              //   width: 170.w,
              // ),
              CachedNetworkImage(
                imageUrl: orderItem.product.imageUrl.first,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 190.h,
                width: 170.w,
                fit: BoxFit.scaleDown,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Container(
                        color: AppColors.gambogeColor,
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Text(
                            orderItem.product.tag,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: AppColors.whiteColor,
                              fontSize: AppSizes.extraSmallText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        color: AppColors.whiteColor,
                        child: Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Text(
                            "đ\t\t\t\t${AppFormat.currencyFormat.format(orderItem.product.price)}",
                            style: TextStyle(
                              fontSize: AppSizes.smallText,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 230.w,
                        child: Text(
                          orderItem.product.name,
                          style: AppStyles.boldSmallTextStyle,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      isWishList
                          ? const SizedBox.shrink()
                          : Text(
                              "Size: ${orderItem.size} UK - Qty: ${orderItem.quantity}",
                              style: TextStyle(
                                fontSize: AppSizes.smallText,
                                color: AppColors.nobelColor,
                              ),
                            ),
                      SizedBox(height: 10.h),
                      CartItemSaveButton(
                          function: () {}, isWishList: isWishList),
                      SizedBox(height: 14.h),
                    ],
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: dotsOnClick,
                      child: Image.asset(
                          'assets/icons/menu_dots_vertical_icon.png'),
                    ),
                    height: 16.h,
                    width: 16.w,
                    right: 0.w,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 3.h),
      ],
    );
  }
}
