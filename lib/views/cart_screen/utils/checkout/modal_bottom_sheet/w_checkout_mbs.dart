import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/payment/w_payment_select.dart';
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
    // final _oCcy = NumberFormat("#,##0", "en_US");
    // final List<String> _imageUrls = [
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    //   'assets/images/temp_sneaker.png',
    // ];
    refresh(String val) => setState(() {
          //String _txt = val;
        });
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

    // Widget checkoutMainPage(List<String> imageUrls) => Scaffold(
    //       appBar: const CheckoutAppBar(),
    //       body: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 6.h),
    //             ExpandImageGrid(imageUrls: imageUrls),
    //             OrderInformation(
    //               title: "SHIPPING",
    //               content: const ShippingInformation(),
    //               onTap: () {},
    //             ),
    //             Container(height: 0.5.h, color: AppColors.kSubTitleText),
    //             OrderInformation(
    //               title: "PAYMENT",
    //               content: const Text(
    //                 "Select payment method",
    //                 style: TextStyle(color: AppColors.kNavyFont),
    //               ),
    //               onTap: () => setState(() => context
    //                   .read<CheckoutCartConfigProvider>()
    //                   .onPageTransition(true, 2, PaymentSelect.height)),
    //             ),
    //             Container(height: 0.5.h, color: AppColors.kSubTitleText),
    //             OrderInformation(
    //               title: "BILLING ADDRESS",
    //               content: const BillingAdressInformation(),
    //               onTap: () {},
    //             ),
    //             Container(height: 0.5.h, color: AppColors.kSubTitleText),
    //             OrderInformation(
    //               title: "PROMO CODE",
    //               content: const Text(
    //                 "Pick discount",
    //                 style: TextStyle(color: AppColors.kNavyFont),
    //               ),
    //               onTap: () {},
    //             ),
    //             Container(height: 0.5.h, color: AppColors.kSubTitleText),
    //             OrderInformation(
    //               title: "TOTAL",
    //               content: Text(
    //                 "đ\t\t\t\t${_oCcy.format(17500000)}",
    //               ),
    //               onTap: () {},
    //             ),
    //             Container(height: 0.5.h, color: AppColors.kSubTitleText),
    //             const CheckoutPolicyTerm(),
    //             Padding(
    //               padding: EdgeInsets.only(left: 16.w, right: 16.w),
    //               child: MyTextButton(
    //                 function: () {},
    //                 content: "PLACE ORDER",
    //                 isLoading: false,
    //               ),
    //             ),
    //             SizedBox(height: 8.h),
    //           ],
    //         ),
    //       ),
    //     );

    final List<List<Widget>> _pages = [
      [CheckoutMainPage(updateParent: refresh)],
      _shippingPages,
      _paymentPages,
    ];

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
