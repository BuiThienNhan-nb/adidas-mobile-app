import 'package:flutter/material.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../../models/product_type.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
    required this.productType,
  }) : super(key: key);

  final ProductType productType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cateAppBar(productType.name),
      body: ListView.builder(
        itemCount: productType.categories.length,
        itemBuilder: (context, index) => CategoryItem(
          productCategory: productType.categories[index],
        ),
      ),
    );
  }
}

AppBar cateAppBar(String title) => AppBar(
      title: Text(
        title,
        style: AppStyles.boldLargeTextStyle,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
    );
