import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../configs/palette.dart';
import '../../../../../../../configs/style.dart';

InkWell addressPickerItem(Function(String value) onTap, String content) =>
    InkWell(
      onTap: () {
        onTap(content);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Text(content, style: AppStyles.regularTextStyle),
          ),
          Container(
            height: 1.h,
            color: AppColors.silverColor,
          )
        ],
      ),
    );
