import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: 'SIZE GUIDE'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MEN'S AND WOMEN'S ADIDAS FOOTWEAR SIZING",
                style: AppStyles.boldLargeTextStyle,
              ),
              SizedBox(height: 52.h),
              Text(
                  'UK\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tHEEL-TOE',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '5.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t23.8 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '6\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t24.1 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '6.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t24.6 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '7\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t25.1 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '7.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t25.4 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '8\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t25.9 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '8.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t26.4 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '9\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t26.6 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '9.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t27.1 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '10\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t27.6 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '10.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t27.9 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '11\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t28.4 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '11.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t28.9 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '12\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t29.2 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '12.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t29.7 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '13\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t30.2 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '13.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t30.4 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '14\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t30.9 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '14.5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t31.4 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '15\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t32.2 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '16\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t33 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '17\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t34 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
              SizedBox(height: 12.h),
              Text(
                  '18\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t34.7 cm',
                  style: AppStyles.regularTextStyle),
              SizedBox(height: 12.h),
              Container(
                color: AppColors.greyBackground,
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
