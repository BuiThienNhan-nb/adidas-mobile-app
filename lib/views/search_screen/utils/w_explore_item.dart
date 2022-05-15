import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/format.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Item(
          product: products[index],
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
      color: AppColors.sneakerItemBackground,
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: _product.image,
            placeholder: (context, url) => const CircularProgressIndicator(),
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
                  color: AppColors.backgroundColor,
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
                    color: AppColors.subTitleText,
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
