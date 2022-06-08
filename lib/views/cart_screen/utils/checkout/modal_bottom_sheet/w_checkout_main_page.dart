import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/orders/order_detail_screen.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../configs/format.dart';
import '../../../../../configs/palette.dart';
import '../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import '../../../../../view_models/order_view_model/order_provider.dart';
import '../../../../profile_screen/auth/widget/auth_dialog.dart';
import '../../../../utils/button/my_text_button.dart';
import 'billing_address/w_bill_adress_info.dart';
import 'payment/w_payment_select.dart';
import 'promotion/w_promotion.dart';
import 'shipping/w_shipping_content.dart';
import 'utils/w_checkout_app_bar.dart';
import 'utils/w_checkout_policy_term.dart';
import 'utils/w_expand_photo.dart';
import 'utils/w_order_info.dart';

class CheckoutMainPage extends StatefulWidget {
  const CheckoutMainPage({Key? key, required Function updateParent})
      : _updateParent = updateParent,
        super(key: key);

  final Function _updateParent;

  @override
  State<CheckoutMainPage> createState() => _CheckoutMainPageState();
}

class _CheckoutMainPageState extends State<CheckoutMainPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> _imageUrls = [
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
      'assets/images/temp_sneaker.png',
    ];
    return Scaffold(
      appBar: const CheckoutAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            ExpandImageGrid(imageUrls: _imageUrls),
            OrderInformation(
              title: "SHIPPING",
              content: const ShippingInformation(),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.nobelColor),
            OrderInformation(
              title: "PAYMENT",
              content: Text(
                context.read<OrderProvider>().order.paymentMethod,
                style: TextStyle(
                  color: context.read<OrderProvider>().order.paymentMethod ==
                          "Select payment method"
                      ? AppColors.toryBlueColor
                      : AppColors.blackColor,
                ),
              ),
              onTap: () {
                setState(() => context
                    .read<CheckoutCartConfigProvider>()
                    .onPageTransition(true, 2, PaymentSelect.height));
                widget._updateParent("");
              },
            ),
            Container(height: 0.5.h, color: AppColors.nobelColor),
            OrderInformation(
              title: "BILLING ADDRESS",
              content: const BillingAddressInformation(),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.nobelColor),
            OrderInformation(
              title: "PROMO CODE",
              content: Text(
                context.read<OrderProvider>().order.promotionId ??
                    "Pick discount",
                style: TextStyle(
                  color: context.read<OrderProvider>().order.promotionId ==
                              null ||
                          context.read<OrderProvider>().order.promotionId == ""
                      ? AppColors.toryBlueColor
                      : AppColors.blackColor,
                ),
              ),
              onTap: () {
                setState(() => context
                    .read<CheckoutCartConfigProvider>()
                    .onPageTransition(true, 3, PromotionWidget.height));
                widget._updateParent("");
              },
            ),
            Container(height: 0.5.h, color: AppColors.nobelColor),
            OrderInformation(
              title: "TOTAL",
              content: Text(
                "đ\t\t\t\t${AppFormat.currencyFormat.format(context.read<OrderProvider>().order.total)}",
              ),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.nobelColor),
            const CheckoutPolicyTerm(),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Consumer<AuthProvider>(
                builder: (_, value, __) => MyTextButton(
                  function: () => onOrderButtonClick(context),
                  content: "PLACE ORDER",
                  isLoading: context.read<AuthProvider>().isLoading,
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

void onOrderButtonClick(BuildContext context) {
  /// Validate order
  if (context.read<OrderProvider>().order.paymentMethod ==
          'Select payment method' ||
      context.read<OrderProvider>().order.promotionId == null) {
    log('[ORDER] validate return false');
    showFailureDialog(context,
        'All the necessary information must be completed fill before place an order!');
    return;
  }
  log('[ORDER] paymentMethod: ${context.read<OrderProvider>().order.paymentMethod} - promotionId: ${context.read<OrderProvider>().order.promotionId}');

  /// Order action
  context.read<AuthProvider>().isLoading = true;
  Future.delayed(const Duration(seconds: 2)).then(
    (value) {
      log('[ORDER] place order button clicked!');
      Navigator.of(context)
        ..pop()
        ..push(
          CupertinoPageRoute<void>(
            builder: (context) => OrderDetailScreen(
              order: context.read<OrderProvider>().order,
              title: 'BOOM. ORDERED.',
            ),
          ),
        );
      context.read<AuthProvider>().isLoading = false;
    },
  );
}

void showFailureDialog(BuildContext context, String subTitle) =>
    showAnimatedDialog(
      context: context,
      builder: (context) => AuthDialog(
        title: "Failure Request",
        subTitle: subTitle,
        btnTitle: "CANCEL",
      ),
      barrierDismissible: true,
      animationType: DialogTransitionType.size,
      duration: const Duration(milliseconds: 300),
    );
