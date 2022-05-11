import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdBannerCarouselItem extends StatelessWidget {
  const AdBannerCarouselItem({
    Key? key,
    required AdBanner adBanner,
    required Widget wChild,
  })  : _adBanner = adBanner,
        _wChild = wChild,
        super(key: key);

  final AdBanner _adBanner;
  final Widget _wChild;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _wChild,
        // Expanded(
        //   child: Container(
        //     color: Colors.green,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: AppColors.iconBackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  _adBanner.tag,
                  style: AppStyles.whiteRegularTextStyle,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 36.w),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 320.w,
                  color: AppColors.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      _adBanner.title,
                      style: AppStyles.boldItalicRegularTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  color: AppColors.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      'JUST DROPPED',
                      style: AppStyles.italicRegularTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                CarouselItemButton(),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselItemButton extends StatelessWidget {
  CarouselItemButton({
    Key? key,
  }) : super(key: key);

  final double height = 52.h;
  final double width = 320.w;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => log('BUTTON SHOP NOW CLICKED'),
        child: SizedBox(
          height: height * 1.4,
          width: width * 1.2,
          child: Stack(
            children: [
              Positioned(
                left: 8.w,
                top: 8.h,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.backgroundColor),
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                color: AppColors.backgroundColor,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      'SHOP NOW',
                      style: GoogleFonts.cantarell(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.titleFontSize - 5,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/arrow_right.png',
                      width: width / 12,
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  //   return Stack(
  //     child: Container(
  //       height: 54.h,
  //       width: 320.w,
  //       decoration: BoxDecoration(
  //         color: AppColors.backgroundColor,
  //         borderRadius: BorderRadius.circular(0.0),
  //         boxShadow: const [
  //           BoxShadow(
  //             color: Colors.transparent,
  //             blurRadius: 0.0,
  //             offset: Offset(4, 8),
  //           ),
  //         ],
  //       ),
  //       child: Text(
  //         'SHOP NOW',
  //         style: AppStyles.regularTextStyle,
  //       ),
  //     ),
  //   );
  // }
}
