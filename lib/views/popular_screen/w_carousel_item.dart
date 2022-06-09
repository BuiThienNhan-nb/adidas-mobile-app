import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';
import '../../configs/style.dart';
import '../../models/ad_banner.dart';
import '../../models/product.dart';
import '../product_screen/screens/product_detail_screen.dart';
import '../utils/button/outline_shadow_button.dart';

class AdBannerCarouselItem extends StatelessWidget {
  const AdBannerCarouselItem({
    Key? key,
    required AdBanner adBanner,
    required Widget wChild,
    required int index,
  })  : _adBanner = adBanner,
        _wChild = wChild,
        _index = index,
        super(key: key);

  final AdBanner _adBanner;
  final Widget _wChild;
  final int _index;

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
              color: AppColors.blackColor,
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
                  color: AppColors.whiteColor,
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
                  color: AppColors.whiteColor,
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
                  onTap: () {
                    log('SHOP NOW BUTTON CLICKED');
                    Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute(
                        builder: (_) => ProductDetailScreen(
                          heroTag: 'heroTag',
                          product: _adBanner.product,
                          index: _index,
                          //  Product(
                          //   imageUrl: [
                          //     'assets/fwdxparley/fwd_parley_1.png',
                          //     'assets/fwdxparley/fwd_parley_2.png',
                          //     'assets/fwdxparley/fwd_parley_3.png',
                          //     'assets/fwdxparley/fwd_parley_4.png',
                          //     'assets/fwdxparley/fwd_parley_5.png',
                          //     'assets/fwdxparley/fwd_parley_6.png',
                          //     'assets/fwdxparley/fwd_parley_7.png',
                          //   ],
                          //   tag: 'NEW',
                          //   price: 1200000,
                          //   name: 'Giày Adidas 4D FWD x PARLEY',
                          // ),
                        ),
                      ),
                    );
                  },
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
