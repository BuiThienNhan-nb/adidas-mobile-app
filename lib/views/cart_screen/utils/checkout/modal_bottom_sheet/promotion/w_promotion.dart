import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import '../../../../../../view_models/order_view_model/order_provider.dart';
import '../../../../../profile_screen/auth/widget/auth_dialog.dart';
import '../../../../../profile_screen/profile/settings/settings/setting_app_bar.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../../../../../utils/input/text_field_input.dart';
import '../w_checkout_mbs.dart';

class PromotionWidget extends StatefulWidget {
  static double height = 440.h;

  const PromotionWidget({
    Key? key,
    required Function updateParent,
    required this.promotionId,
  })  : _updateParent = updateParent,
        super(key: key);

  final Function _updateParent;
  final String? promotionId;

  @override
  State<PromotionWidget> createState() => _PromotionWidgetState();
}

class _PromotionWidgetState extends State<PromotionWidget> {
  final TextEditingController _promotionIdController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _promotionIdController.text = widget.promotionId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    backToCart() {
      context.read<CheckoutCartConfigProvider>().onPageTransition(
            false,
            0,
            CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
          );

      widget._updateParent("");
    }

    checkPromotion() {
      String title = "Applied Promotion";
      String subTitle =
          "Cart total has been updated, get back and check it out.";
      String btnTitle = "GET BACK TO CART";
      Duration duration = const Duration(milliseconds: 1);

      if (_promotionIdController.text == "") {
        title = "Apply Promotion Failed";
        subTitle = "This promotion has been used, expired or doesn't exits!";
        btnTitle = "TRY ANOTHER PROMOTION";
      } else {
        setState(() => context.read<AuthProvider>().isLoading = true);
        duration = const Duration(seconds: 2);
      }
      Future.delayed(duration).then(
        (value) => showAnimatedDialog(
          context: context,
          builder: (context) => AuthDialog(
            title: title,
            subTitle: subTitle,
            btnTitle: btnTitle,
          ),
          barrierDismissible: true,
          animationType: DialogTransitionType.size,
          duration: const Duration(milliseconds: 300),
        ).then((value) {
          if (_promotionIdController.text == "") {
          } else {
            context.read<OrderProvider>().order.total =
                (context.read<OrderProvider>().order.total * 0.8).toInt();
            context.read<OrderProvider>().order.promotionId =
                _promotionIdController.text.toUpperCase().trim();
            context.read<AuthProvider>().isLoading = false;
            backToCart();
          }
        }),
      );
    }

    return Scaffold(
      appBar: const SettingAppBar(title: "PROMOTION"),
      body: Padding(
        // padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldInput(
              onTextSubmitted: (val) {},
              textController: _promotionIdController,
              textInputType: TextInputType.name,
              validator:
                  RequiredValidator(errorText: "Promotion Id is required"),
              labelText: "PROMOTION ID",
            ),
            const Expanded(child: SizedBox.shrink()),
            MyTextButton(
              function: checkPromotion,
              content: "APPLY PROMOTION",
              isLoading: context.read<AuthProvider>().isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
