import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../../models/product.dart';
import 'filter_result_item.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: filterResultAppBar('MEN ● SHOES'),
      // body: Container(
      //   child: Center(
      //     child: FilterResultItem(product: products.first),
      //   ),
      // ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 4.h,
        ),
        itemBuilder: (context, index) => FilterResultItem(
          product: products[index],
        ),
        // Container(
        //   color: AppColors.aliceBlueColor,
        //   width: (MediaQuery.of(context).size.width / 2) - 2.w,
        // ),,
        itemCount: products.length,
      ),
    );
  }
}

AppBar filterResultAppBar(String title) => AppBar(
      title: Text(
        title,
        style: AppStyles.boldRegularTextStyle,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      backgroundColor: AppColors.whiteColor,
      elevation: 0.8.w,
      actions: <Widget>[
        GestureDetector(
          onTap: () => log('App Bar search icon clicked'),
          child: Image.asset(
            'assets/icons/search_icon_light.png',
            height: 18.h,
            width: 18.w,
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
