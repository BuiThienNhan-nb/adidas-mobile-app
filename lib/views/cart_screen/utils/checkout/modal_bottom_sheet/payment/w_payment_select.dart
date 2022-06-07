import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/style.dart';
import '../../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import '../../../../../../view_models/order_view_model/order_provider.dart';
import '../../../../../profile_screen/auth/widget/auth_dialog.dart';
import '../../../../../profile_screen/profile/settings/settings/setting_app_bar.dart';
import '../w_checkout_mbs.dart';

class PaymentSelect extends StatelessWidget {
  static double height = 200.h;

  const PaymentSelect({
    Key? key,
    required Function updateParent,
  })  : _updateParent = updateParent,
        super(key: key);
  final Function _updateParent;

  @override
  Widget build(BuildContext context) {
    showFailureCardPaymentMethod() => showAnimatedDialog(
          context: context,
          builder: (context) => const AuthDialog(
            title: "Choose Method fail",
            subTitle:
                "We sorry that our app haven't support this payment method yet.",
            btnTitle: "Select another method",
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        );

    return Scaffold(
      appBar: const SettingAppBar(title: "PAYMENT"),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.read<CheckoutCartConfigProvider>().onPageTransition(
                      false,
                      0,
                      CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
                    );
                context.read<OrderProvider>().order.paymentMethod =
                    "Cash on delivery";
                _updateParent("");
              },
              child: const PaymentMethod(
                child: CashOnDelivery(),
                title: "Cash on delivery",
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: showFailureCardPaymentMethod,
              child: PaymentMethod(
                child: Image.asset(
                  'assets/images/visa.png',
                  height: 28.h,
                  width: 80.w,
                ),
                title: "Credit Card",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
    required Widget child,
    required String title,
  })  : _child = child,
        _title = title,
        super(key: key);

  final Widget _child;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(color: AppColors.giansboroColor),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.w),
            _child,
            SizedBox(width: 16.w),
            Text(
              _title,
              style: AppStyles.regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class CashOnDelivery extends StatelessWidget {
  const CashOnDelivery({
    Key? key,
    this.height,
    this.width,
    this.textStyle,
  }) : super(key: key);
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 28.h,
      width: width ?? 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.blackColor),
      ),
      child: Text(
        "CASH ON DELIVERY",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
