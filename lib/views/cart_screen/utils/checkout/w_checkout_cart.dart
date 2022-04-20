import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_checkout_mbs.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CheckoutCartContainer extends StatelessWidget {
  const CheckoutCartContainer({
    Key? key,
    required int total,
  })  : _total = total,
        super(key: key);

  final int _total;

  @override
  Widget build(BuildContext context) {
    final _oCcy = NumberFormat("#,##0", "en_US");

    void onCheckoutClick() => showModalBottomSheet<dynamic>(
          context: context,
          // context: context.read<NavBarProvider>().navBarContainerContext,
          isDismissible: false,
          isScrollControlled: true,
          builder: (_) => Wrap(children: const [CheckoutCartBottomSheet()]),
        );

    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "TOTAL",
                  style: AppStyles.titleTextStyle,
                ),
                Text(
                  "đ\t\t\t\t${_oCcy.format(_total)}",
                  style: TextStyle(
                    fontSize: AppSizes.mediumText,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            MyTextButton(
              function: onCheckoutClick,
              content: "CHECKOUT",
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
