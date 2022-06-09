import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';
import '../../../configs/style.dart';
import '../../profile_screen/profile/settings/settings/setting_app_bar.dart';

class OptionsModalBottomSheet extends StatelessWidget {
  const OptionsModalBottomSheet({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);

  final List<Widget> widgets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}

Row optionItem(Image icon, String title) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 24.h, width: 24.w, child: icon),
        SizedBox(width: 12.w),
        Text(title, style: AppStyles.regularTextStyle),
      ],
    );

InkWell buildDotsWidget(Image icon, String title, Function() onTap) => InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            optionItem(icon, title),
            SizedBox(height: 16.h),
            Container(color: AppColors.silverColor, height: 1.h),
          ],
        ),
      ),
    );
