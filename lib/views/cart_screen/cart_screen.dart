import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/palette.dart';
import '../../models/product.dart';
import '../utils/widget/app_bar.dart';
import 'utils/cart_item/w_cart_item.dart';
import 'utils/checkout/w_checkout_cart.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;
  final Map<String, Widget> optionItems = {
    "Move to wishlist": Image.asset('assets/icons/heart_icon_light.png'),
    "Remove from cart": Image.asset('assets/icons/trash_icon.png'),
  };

  @override
  Widget build(BuildContext context) {
    //String _content = "Loading...";

    return Scaffold(
        appBar: const MyAppBar(
          isPopularScreen: false,
          title: "SHOPPING CART",
        ),

        /// Empty cart widget show when cart quantity == 0

        body: context.read<AuthProvider>().isLogin
            ? Consumer<CartProvider>(
                builder: ((_, provider, __) {
                  provider.sumPrice();
                  return cartScreen(
                      listProd: provider.listProduct, provider: provider);
                }),
              )
            : Container());
    //   FutureBuilder<List<Product>>(
    //         future: DataRepository()
    //             .getListBag(id: context.read<UserProvider>().user.id),
    //         builder: (_, snapShot) {
    //           // print(snapShot.data);
    //           if (snapShot.connectionState == ConnectionState.done) {
    //             context.read<CartProvider>().listProduct =
    //                 snapShot.data!;
    //             return cartScreen(
    //                 listProd:
    //                     context.read<CartProvider>().listProduct);
    //           } else {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //         },
    //       )),
    // )
  }

  Widget cartScreen(
      {required List<Product> listProd, required CartProvider provider}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text("${listProd.length}   P R O D U C T S"),
        ),
        SizedBox(height: 12.h),
        Divider(height: 3.h, color: AppColors.blackColor),

        /// Temp cart item
        Expanded(
          child: ListView.builder(
            itemCount: listProd.length,
            itemBuilder: (context, index) => CartItem(
              product: listProd[index],
              appContext: appContext,
              isWishList: false,
              optionItems: optionItems,
            ),
          ),
        ),
        CheckoutCartContainer(total: provider.price),
      ],
    );
  }
}
