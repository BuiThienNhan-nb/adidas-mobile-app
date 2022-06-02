import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';
import '../../configs/style.dart';

class FilterModalBottomSheet extends StatelessWidget {
  const FilterModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: 'SORT BY'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filterItems('Recently added', true),
          filterItems('Price (high-low)', false),
          filterItems('Price (low-high)', false),
        ],
      ),
    );
  }
}

Material filterItems(String title, bool isSelected) => Material(
      child: InkWell(
        onTap: () => log('filter item clicked!'),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 4.w),
                  Text(title, style: AppStyles.regularTextStyle),
                  const Spacer(),
                  isSelected
                      ? Image.asset(
                          'assets/icons/check_icon.png',
                          height: 16.h,
                          width: 16.w,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: 4.w),
                ],
              ),
              SizedBox(height: 16.h),
              Container(color: AppColors.greyBackground, height: 1.h),
            ],
          ),
        ),
      ),
    );
