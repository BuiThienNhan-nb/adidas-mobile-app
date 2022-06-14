import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/promotion.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import '../../../../../profile_screen/auth/widget/auth_dialog.dart';
import '../../../../../profile_screen/profile/settings/settings/setting_app_bar.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../../../../../utils/input/text_field_input.dart';
import '../w_checkout_mbs.dart';
import 'package:collection/collection.dart';

// class PromotionWidget extends StatefulWidget {
//   static double height = 440.h;

//   const PromotionWidget({
//     Key? key,
//     required Function updateParent,
//     required this.promotionId,
//   })  : _updateParent = updateParent,
//         super(key: key);

//   final Function _updateParent;
//   final String? promotionId;

//   @override
//   State<PromotionWidget> createState() => _PromotionWidgetState();
// }

// class _PromotionWidgetState extends State<PromotionWidget> {
//   final TextEditingController _promotionIdController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _promotionIdController.text = widget.promotionId ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     backToCart() {
//       context.read<CheckoutCartConfigProvider>().onPageTransition(
//             false,
//             0,
//             CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
//           );

//       widget._updateParent("");
//     }

//     void checkPromotion() {
//       String title = "Applied Promotion";
//       String subTitle =
//           "Cart total has been updated, get back and check it out.";
//       String btnTitle = "GET BACK TO CART";
//       Duration duration = const Duration(milliseconds: 1);
//       String id = _promotionIdController.text;

//       if (id == '' ||
//           !AppMockData().promotions.any((promotion) => promotion.id == id)) {
//         title = "Apply Promotion Failed";
//         subTitle = "This promotion has been used, expired or doesn't exits!";
//         btnTitle = "TRY ANOTHER PROMOTION";
//       }

//       if (_promotionIdController.text == "" ||
//           !AppMockData().promotions.any(
//               (promotion) => promotion.id == _promotionIdController.text)) {
//         title = "Apply Promotion Failed";
//         subTitle = "This promotion has been used, expired or doesn't exits!";
//         btnTitle = "TRY ANOTHER PROMOTION";
//       } else {
//         setState(() => context.read<AuthProvider>().isLoading = true);
//         duration = const Duration(seconds: 2);
//       }
//       Future.delayed(duration).then(
//         (value) => showAnimatedDialog(
//           context: context,
//           builder: (context) => AuthDialog(
//             title: title,
//             subTitle: subTitle,
//             btnTitle: btnTitle,
//           ),
//           barrierDismissible: true,
//           animationType: DialogTransitionType.size,
//           duration: const Duration(milliseconds: 300),
//         ).then((value) {
//           if (_promotionIdController.text == "") {
//           } else {
//             context.read<OrderProvider>().order.total =
//                 (context.read<OrderProvider>().order.total * 0.8).toInt();
//             context.read<OrderProvider>().order.promotion!.id =
//                 _promotionIdController.text.toUpperCase().trim();
//             context.read<AuthProvider>().isLoading = false;
//             backToCart();
//           }
//         }),
//       );
//     }

//     return Scaffold(
//       appBar: const SettingAppBar(title: "PROMOTION"),
//       body: Padding(
//         // padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
//         padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFieldInput(
//               onTextSubmitted: (val) {},
//               textController: _promotionIdController,
//               textInputType: TextInputType.name,
//               validator:
//                   RequiredValidator(errorText: "Promotion Id is required"),
//               labelText: "PROMOTION ID",
//             ),
//             const Expanded(child: SizedBox.shrink()),
//             MyTextButton(
//               function: checkPromotion,
//               content: "APPLY PROMOTION",
//               isLoading: context.read<AuthProvider>().isLoading,
//             ),
//           ],
//         ),
//       ),
//     );

//   }
// }

class PromotionWidget extends StatelessWidget {
  static double height = 460.h;
  const PromotionWidget({
    Key? key,
    required this.updateParent,
    required this.promotionId,
  }) : super(key: key);

  final Function updateParent;
  final String promotionId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _promotionIdController =
        TextEditingController(text: promotionId);

    void backToCart() {
      context.read<CheckoutCartConfigProvider>().onPageTransition(
            false,
            0,
            CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
          );

      updateParent("");
    }

    void showDialog(Duration duration, String title, String subTitle,
        String btnTitle, bool validate) {
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
          context.read<AuthProvider>().isLoading = false;
          if (validate) {
            backToCart();
          }
        }),
      );
    }

    void checkPromotion() {
      context.read<AuthProvider>().isLoading = true;
      String title = "Apply Promotion Failed";
      String subTitle =
          "This promotion has been used, expired or doesn't exits!";
      String btnTitle = "TRY ANOTHER PROMOTION";
      Duration duration = const Duration(milliseconds: 400);
      String id = _promotionIdController.text;
      Promotion? promotion = AppMockData().promotions.firstWhereOrNull(
          (promotion) => promotion.id.compareTo(id.toUpperCase().trim()) == 0);

      if (promotion != null && promotionId.compareTo(id) != 0) {
        log('1');
        title = "Applied Promotion";
        subTitle = "Cart total has been updated, get back and check it out.";
        btnTitle = "GET BACK TO CART";
        context.read<OrderProvider>().order.promotion = promotion;
        if (promotion.discount < 1) {
          context.read<OrderProvider>().order.total =
              (context.read<OrderProvider>().order.total *
                      (1 - promotion.discount))
                  .ceil();
        } else {
          context.read<OrderProvider>().order.total -=
              promotion.discount.toInt();
        }
        showDialog(duration, title, subTitle, btnTitle, true);
        return;
      }

      if (promotionId.compareTo(id) == 0) {
        subTitle =
            'This promotion has been currently applied for this order, try another or just get back!';
      }
      showDialog(duration, title, subTitle, btnTitle, false);
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
            Consumer<AuthProvider>(
              builder: (_, __, ___) => MyTextButton(
                function: checkPromotion,
                content: "APPLY PROMOTION",
                isLoading: context.read<AuthProvider>().isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
