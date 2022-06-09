import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/view_models/wish_list_view_model/wish_list_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/palette.dart';
import '../../models/product.dart';
import '../cart_screen/utils/cart_item/w_cart_item.dart';
import '../utils/widget/app_bar.dart';
import 'w_filter_modal_bottom_sheet.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({
    Key? key,
    required this.appContext,
  }) : super(key: key);

  final BuildContext appContext;
  final Map<String, Widget> optionItems = {
    "Add to cart": Image.asset('assets/icons/heart_icon_light.png'),
    "Remove from Wishlist": Image.asset('assets/icons/trash_icon.png'),
  };
  Filter filterOption = Filter.recentlyAdded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "WISHLIST",
      ),

      // body: Container(
      //   color: Colors.white,
      //   child: const EmptyListWidget(),
      // ),

      body: context.read<AuthProvider>().isLogin
          ? Consumer<WishListProvider>(
              builder: (_, provider, __) => listItem(list: provider.listWish)
              // FutureBuilder<List<Product>>(
              //     future: DataRepository()
              //         .getListFav(id: context.read<UserProvider>().user.id),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         provider.listWish = snapshot.data!;

              //         return listItem(list: provider.listWish);
              //       } else {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //     }),
              )
          : Container(),
    );
  }

  Widget listItem({required List<Product> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            Text("${list.length}   P R O D U C T S"),
            const Spacer(),
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: showFilterModalBottomSheet,
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Image.asset(
                  'assets/icons/filter_icon.png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        SizedBox(height: 12.h),
        Divider(height: 3.h, color: AppColors.blackColor),

        /// Temp cart item
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => CartItem(
              product: list[index],
              appContext: appContext,
              isWishList: true,
              optionItems: optionItems,
            ),
          ),
        ),
      ],
    );
  }

  void showFilterModalBottomSheet() {
    showModalBottomSheet<dynamic>(
      context: appContext,
      isScrollControlled: true,
      builder: (_) => SizedBox(
        height: 240.h,
        width: double.infinity,
        child: FilterModalBottomSheet(
          currentFilter: filterOption,
          callback: (newVal) {
            filterOption = newVal;
            log('[FILTER] filter option: $filterOption, callbackVal: $newVal');
            // Navigator.of(appContext).pop();
          },
        ),
      ),
    );
    // .then(
    //   (value) => Navigator.of(context).push(
    //     CupertinoPageRoute<void>(
    //       builder: (BuildContext context) => const TestScreen(),
    //     ),
    //   ),
    // );
  }
}
