import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/views/search_screen/utils/store/store_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../utils/button/outline_shadow_button.dart';

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
                  color: AppColors.blackColor,
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
                  onTap: () => Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute(
                      builder: (context) => const StoreScreen(),
                    ),
                  ),
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
      color: AppColors.whiteColor,
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
