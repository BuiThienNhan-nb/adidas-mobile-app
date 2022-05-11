import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/format.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/cart_item/w_cart_item_save_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required Product product})
      : _product = product,
        super(key: key);
  final Product _product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.sneakerItemBackground,
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
                    color: AppColors.itemTagBackground,
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Text(
                        _product.tag,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.backgroundColor,
                          fontSize: AppSizes.extraSmallText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    color: AppColors.backgroundColor,
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Text(
                        "đ\t\t\t\t${AppFormat.currencyFormat.format(_product.price)}",
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
                      style: AppStyles.boldSmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Size: 9 UK - Qty: 1",
                    style: TextStyle(
                      fontSize: AppSizes.smallText,
                      color: AppColors.subTitleText,
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
