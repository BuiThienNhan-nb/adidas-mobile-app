import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/format.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../../models/product.dart';

class FilterResultItem extends StatelessWidget {
  const FilterResultItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => log(product.toJson()),
        child: Container(
          color: AppColors.aliceBlueColor,
          padding: EdgeInsets.only(left: 4.w),
          // color: Colors.teal,
          // width: (MediaQuery.of(context).size.width / 2) - 2.w,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Image.asset(
                  //   product.imageUrl.first,
                  //   // height: 180.h,
                  //   // fit: BoxFit.fill,
                  // ),
                  CachedNetworkImage(
                    imageUrl: product.imageUrl.first,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    // height: 68.h,
                    // width: 80.w,
                    // fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: Image.asset(
                      'assets/icons/heart_icon_light.png',
                      height: 24.h,
                      width: 28.w,
                      fit: BoxFit.fill,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.all(8.w),
                child: Text(
                  '${AppFormat.currencyFormat.format(product.price)}\t\tđ',
                  style: AppStyles.smallTextStyle,
                ),
              ),
              Text(
                product.name,
                style: AppStyles.boldRegularTextStyle,
              ),
              // SizedBox(height: 4.h),
              Text(
                'Sportswear',
                style: AppStyles.subTextStyle,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
