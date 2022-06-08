import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/product_screen/screens/product_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/format.dart';
import '../../../configs/palette.dart';
import '../../../configs/size.dart';
import '../../../configs/style.dart';
import '../../../models/product.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  final List<Product> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (index == 0) ? SizedBox(width: 40.w) : SizedBox(width: 4.w),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => ProductDetailScreen(
                heroTag: 'from_news_feed',
                product: Product(
                  imageUrl: [
                    'assets/fwdxparley/fwd_parley_1.png',
                    'assets/fwdxparley/fwd_parley_2.png',
                    'assets/fwdxparley/fwd_parley_3.png',
                    'assets/fwdxparley/fwd_parley_4.png',
                    'assets/fwdxparley/fwd_parley_5.png',
                    'assets/fwdxparley/fwd_parley_6.png',
                    'assets/fwdxparley/fwd_parley_7.png',
                  ],
                  tag: 'NEW',
                  price: 1200000,
                  name: 'Giày Adidas 4D FWD x PARLEY',
                ),
              ),
            ),
          ),
          child: Item(
            product: products[index],
          ),
        ),
        (index == products.length - 1)
            ? SizedBox(width: 40.w)
            : SizedBox(width: 4.w),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required Product product,
  })  : _product = product,
        super(key: key);

  final Product _product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.aliceBlueColor,
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: _product.imageUrl.first,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 148.h,
            width: 160.w,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
                    child: Text(
                      "đ\t\t${AppFormat.currencyFormat.format(_product.price)}",
                      style: TextStyle(
                        fontSize: AppSizes.smallText,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  _product.name,
                  style: AppStyles.boldRegularTextStyle,
                ),
                SizedBox(height: 4.h),
                Text(
                  "Men's Performance",
                  style: TextStyle(
                    fontSize: AppSizes.smallText,
                    color: AppColors.nobelColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
