import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';
import '../../configs/style.dart';

class FilterModalBottomSheet extends StatelessWidget {
  FilterModalBottomSheet({
    Key? key,
    required this.currentFilter,
    required this.callback,
  }) : super(key: key);

  final Map<Filter, String> filterOptions = {
    Filter.recentlyAdded: 'Recently added',
    Filter.priceHighLow: 'Price (high-low)',
    Filter.priceLowHigh: 'Price (low-high)',
  };
  final Filter currentFilter;
  final Function(Filter filterCallback) callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: 'SORT BY'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              callback(Filter.recentlyAdded);
              Navigator.of(context).pop();
            },
            child: filterItems(
              filterOptions[Filter.recentlyAdded]!,
              currentFilter == Filter.recentlyAdded,
            ),
          ),
          InkWell(
            onTap: () {
              callback(Filter.priceHighLow);
              Navigator.of(context).pop();
            },
            child: filterItems(
              filterOptions[Filter.priceHighLow]!,
              currentFilter == Filter.priceHighLow,
            ),
          ),
          InkWell(
            onTap: () {
              callback(Filter.priceLowHigh);
              Navigator.of(context).pop();
            },
            child: filterItems(
              filterOptions[Filter.priceLowHigh]!,
              currentFilter == Filter.priceLowHigh,
            ),
          ),
        ],
      ),
    );
  }
}

Padding filterItems(
  String title,
  bool isSelected,
) =>
    Padding(
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
          Container(color: AppColors.silverColor, height: 1.h),
        ],
      ),
    );

enum Filter {
  recentlyAdded,
  priceHighLow,
  priceLowHigh,
}
