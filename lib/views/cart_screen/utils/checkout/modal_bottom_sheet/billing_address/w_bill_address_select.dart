import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/address_book_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../view_models/cart_view_model/checkout_cart_config_provider.dart';
import '../../../../../../view_models/order_view_model/order_provider.dart';
import '../../../../../profile_screen/profile/settings/settings/address_screen/add_new_address_screen.dart';
import '../../../../../profile_screen/profile/settings/settings/setting_app_bar.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../w_checkout_mbs.dart';

// class BillAddressSelect extends StatefulWidget {
//   static double height = 360.h;

//   const BillAddressSelect({
//     Key? key,
//     required Function updateParent,
//     required this.userAddresses,
//   })  : _updateParent = updateParent,
//         super(key: key);

//   final Function _updateParent;
//   final List<UserAddress> userAddresses;

//   @override
//   State<BillAddressSelect> createState() => _BillAddressSelectState();
// }

// class _BillAddressSelectState extends State<BillAddressSelect> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     log(context.read<OrderProvider>().order.userAddress.id);
//     backToCart(int index) {
//       context.read<OrderProvider>().order.userAddress = widget.userAddresses[index];
//       log('[BILL ADDRESS] back to cart');
//       context.read<CheckoutCartConfigProvider>().onPageTransition(
//             false,
//             0,
//             CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
//           );

//       widget._updateParent("");
//     }

//     return Scaffold(
//       appBar: const SettingAppBar(title: "BILLING ADDRESS"),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 214.h,
//               child: ListView.builder(
//                 itemCount: widget.userAddresses.length,
//                 padding: EdgeInsets.only(bottom: 4.h),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => InkWell(
//                   onTap: () => backToCart(index),
//                   child: AddressBookItem(
//                     userAddress: widget.userAddresses[index],
//                     isSelect:
//                         context.read<OrderProvider>().order.userAddress.id ==
//                             widget.userAddresses[index].id,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.h),
//             MyTextButton(
//               function: () => Navigator.of(context, rootNavigator: true).push(
//                 CupertinoPageRoute(
//                   builder: (context) =>
//                       const AddNewAddressScreen(isEdit: false),
//                 ),
//               ),
//               content: "ADD NEW ADDRESS",
//               isLoading: false,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BillAddressSelect extends StatelessWidget {
  static double height = 360.h;

  const BillAddressSelect({
    Key? key,
    required Function updateParent,
    required this.userAddresses,
  })  : _updateParent = updateParent,
        super(key: key);

  final Function _updateParent;
  final List<UserAddress> userAddresses;

  @override
  Widget build(BuildContext context) {
    log('[BILL ADDRESS] current user address id: ${context.read<OrderProvider>().order.userAddress.id}');
    backToCart(int index) {
      context.read<OrderProvider>().order.userAddress = userAddresses[index];
      log('[BILL ADDRESS] back to cart');
      context.read<CheckoutCartConfigProvider>().onPageTransition(
            false,
            0,
            CheckoutCartBottomSheet.mainCheckoutBottomSheetHeight,
          );

      _updateParent("");
    }

    return Scaffold(
      appBar: const SettingAppBar(title: "BILLING ADDRESS"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 214.h,
              child: ListView.builder(
                itemCount: userAddresses.length,
                padding: EdgeInsets.only(bottom: 4.h),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => backToCart(index),
                  child: AddressBookItem(
                    userAddress: userAddresses[index],
                    isSelect:
                        context.read<OrderProvider>().order.userAddress.id ==
                            userAddresses[index].id,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            MyTextButton(
              function: () => Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(
                  builder: (context) =>
                      const AddNewAddressScreen(isEdit: false),
                ),
              ),
              content: "ADD NEW ADDRESS",
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
