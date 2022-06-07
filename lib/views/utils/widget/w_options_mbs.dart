import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';
import '../../../configs/style.dart';
import '../../profile_screen/profile/settings/settings/setting_app_bar.dart';

class OptionsModalBottomSheet extends StatelessWidget {
  const OptionsModalBottomSheet({
    Key? key,
    required this.title,
    required this.optionItems,
  }) : super(key: key);

  final String title;
  final Map<String, Widget> optionItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildWidget(optionItems),
      ),
    );
  }
}

Row optionItem(Widget icon, String title) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 24.h, width: 24.w, child: icon),
        SizedBox(width: 4.w),
        Text(title, style: AppStyles.regularTextStyle),
      ],
    );

List<Widget> buildWidget(Map<String, Widget> items) {
  return items.entries
      .map(
        (e) => Material(
          child: InkWell(
            onTap: () => log('items ${e.key} clicked!'),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  optionItem(e.value, e.key),
                  SizedBox(height: 16.h),
                  Container(color: AppColors.silverColor, height: 1.h),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();
}
