import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configs/palette.dart';
import '../../../configs/style.dart';

class ProductDetailPageView extends StatelessWidget {
  const ProductDetailPageView({
    Key? key,
    required this.imageHeight,
    required this.pages,
    required this.tag,
  }) : super(key: key);

  final double imageHeight;
  final List<Image> pages;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 1, keepPage: true);

    return AnimatedContainer(
      height: imageHeight,
      duration: const Duration(milliseconds: 600),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBackground,
            blurRadius: 4.h,
          ),
        ],
      ),
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
          Positioned(
            right: 12.w,
            top: 16.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset(
                    'assets/icons/cross_icon.png',
                    height: 16.h,
                    width: 16.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 100.h),
                smoothPageIndicator(controller, pages.length),
              ],
            ),
          ),
          Positioned(
            left: 16.w,
            bottom: 8.h,
            child: Container(
              color: AppColors.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  tag,
                  style: AppStyles.italicSmallTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget smoothPageIndicator(PageController controller, int count) =>
    SmoothPageIndicator(
      controller: controller,
      count: count,
      axisDirection: Axis.vertical,
      effect: CustomizableEffect(
        spacing: 8.h,
        activeDotDecoration: DotDecoration(
          width: 16.w,
          height: 4.h,
          color: AppColors.iconBackgroundColor,
        ),
        dotDecoration: DotDecoration(
          width: 1.2.w,
          height: 4.h,
          color: AppColors.iconBackgroundColor,
        ),
      ),
    );
