import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/billing_address/w_bill_address_select.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'payment/w_payment_select.dart';
import 'promotion/w_promotion.dart';
import 'w_checkout_main_page.dart';

class CheckoutCartBottomSheet extends StatefulWidget {
  static final mainCheckoutBottomSheetHeight = 540.h;
  const CheckoutCartBottomSheet({Key? key}) : super(key: key);

  @override
  State<CheckoutCartBottomSheet> createState() =>
      _CheckoutCartBottomSheetState();
}

class _CheckoutCartBottomSheetState extends State<CheckoutCartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    refresh(String val) => setState(() {});

    /// Declare list of pages
    final List<Widget> shippingPages = [];
    final List<Widget> paymentPages = [
      WillPopPage(
        onWillPop: () async {
          setState(
            () => context.read<CheckoutCartConfigProvider>().onPageTransition(
                  false,
                  0,
                  CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
                ),
          );
          return false;
        },
        child: PaymentSelect(updateParent: refresh),
      ),
    ];
    final List<Widget> promotionPages = [
      WillPopPage(
        onWillPop: () async {
          setState(
            () => context.read<CheckoutCartConfigProvider>().onPageTransition(
                  false,
                  0,
                  CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
                ),
          );
          return false;
        },
        child: PromotionWidget(
          updateParent: refresh,
          promotionId: context.read<OrderProvider>().order.promotion == null
              ? ''
              : context.read<OrderProvider>().order.promotion!.id,
        ),
      ),
    ];
    final List<Widget> billingAddressPages = [
      WillPopPage(
        onWillPop: () async {
          setState(
            () => context.read<CheckoutCartConfigProvider>().onPageTransition(
                  false,
                  0,
                  CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
                ),
          );
          return false;
        },
        child: BillAddressSelect(
          updateParent: refresh,
          userAddresses: AppMockData().userAddresses,
        ),
      ),
    ];

    final List<List<Widget>> pages = [
      [CheckoutMainPage(updateParent: refresh)],
      shippingPages,
      paymentPages,
      billingAddressPages,
      promotionPages,
    ];

    /// Build UI
    return AnimatedSize(
      duration: const Duration(milliseconds: 120),
      child: SizedBox(
        height: context.read<CheckoutCartConfigProvider>().bottomSheetHeight,
        width: double.infinity,
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 360),
          reverse: !context.read<CheckoutCartConfigProvider>().isNextPage,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          child:
              pages[context.read<CheckoutCartConfigProvider>().currentSection]
                  [context.read<CheckoutCartConfigProvider>().currentPageIndex],
        ),
      ),
    );
  }
}

class WillPopPage extends StatelessWidget {
  const WillPopPage({
    Key? key,
    required Future<bool> Function()? onWillPop,
    required Widget child,
  })  : _onWillPop = onWillPop,
        _child = child,
        super(key: key);

  final Future<bool> Function()? _onWillPop;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: _child,
    );
  }
}
