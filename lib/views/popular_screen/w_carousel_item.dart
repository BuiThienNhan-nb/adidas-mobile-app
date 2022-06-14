import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';
import '../../configs/style.dart';
import '../../models/ad_banner.dart';
import '../../models/product.dart';
import '../../models/product_type.dart';
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
                          product: Product(
                            id: '6',
                            productCategory: [],
                            productType: ProductType(id: 'fake', name: 'SHOES'),
                            imageUrls: [
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b1027d7e2ba472895e4ae310057664a_9366/Giay_ZX_22_BOOST_trang_GY6694_01_standard.jpg',
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8129befd83a043678710adf5007bf1e7_9366/Giay_ZX_22_BOOST_trang_GY6695_01_standard.jpg',
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/535610eb253e4bf5a004ae0c01551432_9366/FORUM_84_LOW_8K_Mau_xanh_da_troi_GZ6479_01_standard.jpg',
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/923bec57082443e39f92ad6e00cbed3d_9366/Dep_adilette_Comfort_DJen_GZ5896_01_standard.jpg',
                              'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/864091d7955f4521a12facc9018519b9_9366/Giay_Golf_Alphaflex_21_BOA_trang_FZ1032_01_standard.jpg',
                            ],
                            tag: 'NEW',
                            price: 4300000,
                            isFavorite: false,
                            name: 'Giày Golf AlphaFlex 21 BOA',
                          ),
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
