import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/order.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_checkout_mbs.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/login_screen/login_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

    void authenticate() {
      showAnimatedDialog(
        context: context,
        builder: (context) => AuthDialog(
          title: 'Oops!',
          subTitle: 'You must be loged in before check out this section.',
          btnTitle: 'LOGIN',
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
        barrierDismissible: true,
        animationType: DialogTransitionType.size,
        duration: const Duration(milliseconds: 300),
      );
    }

    void onCheckoutClick() {
      if (context.read<AuthProvider>().isLogin) {
        context.read<OrderProvider>().order = Order(
          id: "id",
          userId: "",
          orderTime: DateTime.now(),
          orderAddress: "05/66 Phan Đăng Lưu",
          paymentMethod: "Select payment method",
          receptionName: "Bùi Thiện Nhân",
          receptionPhone: "0762796747",
          promotionId: null,
          total: 17500000,
        );
        showModalBottomSheet<dynamic>(
          context: context,
          // context: context.read<NavBarProvider>().navBarContainerContext,
          isDismissible: false,
          isScrollControlled: true,
          builder: (_) => Wrap(children: const [CheckoutCartBottomSheet()]),
        );
      } else {
        authenticate();
      }
    }

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
