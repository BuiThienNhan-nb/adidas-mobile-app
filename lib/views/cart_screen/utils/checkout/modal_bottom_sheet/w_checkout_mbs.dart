import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/payment/w_payment_select.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/promotion/w_promotion.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_checkout_main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    final List<Widget> _shippingPages = [];
    final List<Widget> _paymentPages = [
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
    final List<Widget> _prommotionPages = [
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
        child: PromotionWidget(updateParent: refresh),
      ),
    ];
    final List<List<Widget>> _pages = [
      [CheckoutMainPage(updateParent: refresh)],
      _shippingPages,
      _paymentPages,
      _prommotionPages,
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
              _pages[context.read<CheckoutCartConfigProvider>().currentSection]
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
