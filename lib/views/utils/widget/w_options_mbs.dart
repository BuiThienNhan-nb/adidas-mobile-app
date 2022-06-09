import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_adidas_clone/view_models/wish_list_view_model/wish_list_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../configs/palette.dart';
import '../../../configs/style.dart';
import '../../profile_screen/profile/settings/settings/setting_app_bar.dart';

class OptionsModalBottomSheet extends StatelessWidget {
  const OptionsModalBottomSheet({
    Key? key,
    required this.title,
    required this.optionItems,
    required this.product,
  }) : super(key: key);

  final String title;
  final Map<String, Widget> optionItems;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildWidget(optionItems, context),
      ),
    );
  }

  Row optionItem(Widget icon, String title) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24.h, width: 24.w, child: icon),
          SizedBox(width: 4.w),
          Text(title, style: AppStyles.regularTextStyle),
        ],
      );

  List<Widget> buildWidget(Map<String, Widget> items, BuildContext context) {
    return items.entries.map(
      (e) {
        return Material(
          child: InkWell(
            onTap: () => onTap(key: e.key, context: context),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  optionItem(e.value, e.key),
                  SizedBox(height: 16.h),
                  Container(color: AppColors.silverColor, height: 1.h),
                ],
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  void onTap({required String key, required BuildContext context}) async {
    switch (key) {
      case "Remove from cart":
        await DataRepository().removeFromBag(
            idProd: product.id!, idUser: context.read<UserProvider>().user.id);
        context.read<CartProvider>().removeProductFromCart(product);
        // showDiaLog(context: context, subTitle: 'remove from bag success');
        break;
      case "Move to wishlist":
        await DataRepository().removeFromBag(
            idProd: product.id!, idUser: context.read<UserProvider>().user.id);
        context.read<CartProvider>().removeProductFromCart(product);
        context.read<WishListProvider>().like(product);
        product.isFav = true;

        break;
      case "Add to cart":
        await DataRepository().addToBag(
            idProd: product.id!, idUser: context.read<UserProvider>().user.id);
        context.read<CartProvider>().addToCart(product);
        context.read<WishListProvider>().disLike(product);
        product.isFav = false;

        // showDiaLog(context: context, subTitle: 'remove from bag success');
        break;
      case "Remove from Wishlist":
        await DataRepository().disLikeProduct(
            idProd: product.id!, idUser: context.read<UserProvider>().user.id);
        product.isFav = false;

        context.read<WishListProvider>().disLike(product);
        break;

      default:
        () {};
    }
  }
  //  "Add to cart": Image.asset('assets/icons/heart_icon_light.png'),
  //   "Remove from Wishlist": Image.asset('assets/icons/trash_icon.png'),

}
