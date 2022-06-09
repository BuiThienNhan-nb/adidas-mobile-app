import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../../models/product_category.dart';
import '../filter_product/filter_result_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.productCategory,
  }) : super(key: key);

  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) {
    final AppMockData searchScreenMockData = AppMockData();
    return Material(
      child: InkWell(
        onTap: () {
          log('[CATEGORY NAME]: ${productCategory.name}');
          Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => FilterResultScreen(
                products: searchScreenMockData.products,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: productCategory.imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 68.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.w),
                  Text(productCategory.name,
                      style: AppStyles.boldRegularTextStyle),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.w,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ),
            Container(color: AppColors.silverColor, height: 1.h),
          ],
        ),
      ),
    );
  }
}
