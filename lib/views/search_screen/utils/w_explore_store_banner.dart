import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/utils/button/outline_empty_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreStoreBanner extends StatelessWidget {
  const ExploreStoreBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/adidas_store.jpg',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28.w, 28.h, 28.w, 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.iconBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      'EXPERIENCE MORE IN STORE',
                      style: AppStyles.italicWhiteRegularTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ItalicTextSubtitle(text: 'STORE FINDER'),
                    SizedBox(width: 4.w),
                    const ItalicTextSubtitle(text: 'SPECIAL EVENTS'),
                  ],
                ),
                SizedBox(height: 4.h),
                const ItalicTextSubtitle(text: 'IN-STORE SERVICES'),
                SizedBox(height: 12.h),
                OutlineShadowButton(
                  content: 'CONTINUE',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItalicTextSubtitle extends StatelessWidget {
  const ItalicTextSubtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Text(
          text,
          style: AppStyles.italicSmallTextStyle,
        ),
      ),
    );
  }
}
