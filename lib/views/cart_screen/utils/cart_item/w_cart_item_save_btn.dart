import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';

class CartItemSaveButton extends StatelessWidget {
  const CartItemSaveButton({
    Key? key,
    required Function() function,
    required this.isWishList,
  })  : _function = function,
        super(key: key);

  final Function() _function;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _function,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.iconBackgroundColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12.w),
            Text(
              isWishList ? "ADD TO BAG" : "SAVE",
              style: AppStyles.boldSmallTextStyle,
            ),
            SizedBox(width: 15.w),
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
              child: isWishList
                  ? Image.asset(
                      'assets/icons/cart_add_icon_light.png',
                      height: 16.h,
                      width: 16.w,
                    )
                  : Image.asset(
                      'assets/icons/heart_icon_light.png',
                      height: 16.h,
                      width: 16.w,
                    ),
            ),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
