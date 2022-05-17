import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../configs/format.dart';
import '../../../../configs/size.dart';
import '../../../../configs/style.dart';
import '../../../../models/order.dart';
import '../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../view_models/order_view_model/order_provider.dart';
import '../../../profile_screen/auth/login_screen/login_screen.dart';
import '../../../profile_screen/auth/widget/auth_dialog.dart';
import '../../../utils/button/my_text_button.dart';
import 'modal_bottom_sheet/w_checkout_mbs.dart';

class CheckoutCartContainer extends StatelessWidget {
  const CheckoutCartContainer({
    Key? key,
    required int total,
  })  : _total = total,
        super(key: key);

  final int _total;

  @override
  Widget build(BuildContext context) {
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
                  "đ\t\t\t\t${AppFormat.currencyFormat.format(_total)}",
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
