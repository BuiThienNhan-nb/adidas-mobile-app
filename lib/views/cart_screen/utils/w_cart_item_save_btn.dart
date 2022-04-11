import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItemSaveButton extends StatelessWidget {
  const CartItemSaveButton({
    Key? key,
    required Function() function,
  })  : _function = function,
        super(key: key);
  final Function() _function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _function,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kIconBackgroundColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12.w),
            Text(
              "SAVE",
              style: AppStyles.regularTextStyle,
            ),
            SizedBox(width: 15.w),
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
              child: const FaIcon(
                FontAwesomeIcons.heart,
                size: 18,
              ),
            ),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
