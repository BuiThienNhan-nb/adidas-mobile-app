import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_adidas_clone/views/utils/button/outline_empty_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      style: AppStyles.italicMediumTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                OutlineShadowButton(
                  content: 'SHOP NOW',
                  onTap: () => log('SHOP NOW BUTTON CLICKED'),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
