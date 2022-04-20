import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/billing_address/w_bill_adress_info.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/payment/w_payment_select.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/shipping/w_shipping_content.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_expand_photo.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/w_order_info.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_adidas_clone/views/utils/widget/privacy_term_dialog.dart';
import 'package:flutter_adidas_clone/views/utils/widget/span_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
    final _oCcy = NumberFormat("#,##0", "en_US");
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
            Container(height: 0.5.h, color: AppColors.kSubTitleText),
            OrderInformation(
              title: "PAYMENT",
              content: Text(
                context.read<OrderProvider>().order.paymentMethod,
                style: const TextStyle(color: AppColors.kNavyFont),
              ),
              onTap: () {
                setState(() => context
                    .read<CheckoutCartConfigProvider>()
                    .onPageTransition(true, 2, PaymentSelect.height));
                widget._updateParent("");
              },
            ),
            Container(height: 0.5.h, color: AppColors.kSubTitleText),
            OrderInformation(
              title: "BILLING ADDRESS",
              content: const BillingAdressInformation(),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.kSubTitleText),
            OrderInformation(
              title: "PROMO CODE",
              content: const Text(
                "Pick discount",
                style: TextStyle(color: AppColors.kNavyFont),
              ),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.kSubTitleText),
            OrderInformation(
              title: "TOTAL",
              content: Text(
                "đ\t\t\t\t${_oCcy.format(17500000)}",
              ),
              onTap: () {},
            ),
            Container(height: 0.5.h, color: AppColors.kSubTitleText),
            const CheckoutPolicyTerm(),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: MyTextButton(
                function: () {},
                content: "PLACE ORDER",
                isLoading: false,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

class CheckoutAppBar extends StatelessWidget implements PreferredSize {
  const CheckoutAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kBackgroundColor,
      shadowColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(
        color: AppColors.kIconBackgroundColor,
      ),
      centerTitle: false,
      title: Text(
        "CHECKOUT",
        style: AppStyles.titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            size: AppSizes.navBarIconSize + 8,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}

class CheckoutPolicyTerm extends StatelessWidget {
  const CheckoutPolicyTerm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void popUpTerm() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "term.md"),
        );
    void popUpPrivacy() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "privacy.md"),
        );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("By clicking PLACE ORDER, I confirm: "),
          TermSpanText(
            contentText1: "I have read, understood and accepted the ",
            linkText1: "Privacy Notice",
            contentText2: " and ",
            linkText2: "Terms and Conditions",
            onTap1: popUpPrivacy,
            onTap2: popUpTerm,
          ),
          TermSpanText(
            contentText1:
                "I hereby consent to the use of my personal data for marketing and promotional purposes as well as its transfer, sharing, disclosure to third parties.",
            linkText1: "Privacy Notice",
            contentText2: "",
            linkText2: "",
            onTap1: popUpPrivacy,
            onTap2: () {},
          ),
        ],
      ),
    );
  }
}
