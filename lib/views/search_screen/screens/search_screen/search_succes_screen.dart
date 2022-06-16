import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../filter_product/filter_result_item.dart';

class SearchSuccessScreen extends StatelessWidget {
  const SearchSuccessScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.65,
        crossAxisCount: 2,
        crossAxisSpacing: 4.w,
        mainAxisSpacing: 4.h,
      ),
      itemBuilder: (context, index) => FilterResultItem(
        product: products[index],
        index: index,
      ),
      // Container(
      //   color: AppColors.aliceBlueColor,
      //   width: (MediaQuery.of(context).size.width / 2) - 2.w,
      // ),,
      itemCount: products.length,
    );
  }
}
