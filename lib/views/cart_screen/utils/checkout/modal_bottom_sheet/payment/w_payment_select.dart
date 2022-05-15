import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_checkout_mbs.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/widget/auth_dialog.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          builder: (context) => AuthDialog(
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
        border: Border.all(color: AppColors.extraGreyBackground),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.iconBackgroundColor),
      ),
      child: Text(
        "CASH ON DELIVERY",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.iconBackgroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
