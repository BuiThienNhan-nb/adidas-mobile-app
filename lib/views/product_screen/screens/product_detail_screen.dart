import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_adidas_clone/views/utils/widget/w_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';
import '../../../models/product.dart';
import '../utils/w_product_detail_component.dart';
import '../utils/w_product_detail_pv.dart';
import '../utils/w_product_images_zoom.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String id = "ProductDetailScreen";

  const ProductDetailScreen({
    Key? key,
    required this.heroTag,
    required this.product,
  }) : super(key: key);
  final String heroTag;
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  final scrollController = ScrollController();
  double imageHeight = 360.h;
  ScrollDirection directionUpdate = ScrollDirection.reverse;

  // @override
  // void initState() {
  //   scrollController.addListener(() {
  //     scrollListener();
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      widget.product.imageUrls.length,
      (index) => MyNetworkImage(
        imageUrl: widget.product.imageUrls[index],
      ),
    );
    int iconIndex = 0;

    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              log('start');
              // UserScrollNotification userScrollNotification =
              //     notification as UserScrollNotification;
              // switch (userScrollNotification.direction) {
              //   case ScrollDirection.forward:
              //     log('forward');
              //     break;
              //   case ScrollDirection.reverse:
              //     log('reverse');
              //     break;
              //   default:
              //     log('idle');
              //     break;
              // }
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ProductImagesZoom(
                          pages: pages, tag: 'navigate_to_images_zoom'),
                    ),
                  ),
                  child: Hero(
                    tag: 'navigate_to_images_zoom',
                    child: ProductDetailPageView(
                      imageHeight: imageHeight,
                      pages: pages,
                      tag: widget.product.tag,
                    ),
                  ),
                ),
                // testScrollWidget(),
                SizedBox(height: 24.h),
                productName(
                  widget.product,
                  iconIndex,
                ),
                SizedBox(height: 24.h),
                Container(
                  color: AppColors.silverColor,
                  height: 1.h,
                ),
                productSizes(context),
                SizedBox(height: 16.h),
                Container(
                  color: AppColors.silverColor,
                  height: 1.h,
                ),
                SizedBox(height: 24.h),
                purchaseProduct(context: context, product: widget.product),
                SizedBox(height: 24.h),
                Container(
                  color: AppColors.silverColor,
                  height: 1.h,
                ),
                SizedBox(height: 24.h),
                productInfo(),
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
