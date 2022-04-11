import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/w_cart_item_save_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required Product product})
      : _product = product,
        super(key: key);
  final Product _product;

  @override
  Widget build(BuildContext context) {
    final _oCcy = NumberFormat("#,##0", "en_US");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.kSneakerItemBackground,
          height: 191.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                _product.image,
                height: 190.h,
                width: 170.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    color: AppColors.kItemTagBackground,
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Text(
                        _product.tag,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.kBackgroundColor,
                          fontSize: AppSizes.extraSmallText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    color: AppColors.kBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Text(
                        "đ\t\t\t\t${_oCcy.format(_product.price)}",
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
                      _product.name,
                      style: AppStyles.regularTextStyle,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Size: 9 UK - Qty: 1",
                    style: TextStyle(
                      fontSize: AppSizes.smallText,
                      color: AppColors.kSubTitleText,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CartItemSaveButton(function: () {}),
                  SizedBox(height: 14.h),
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
