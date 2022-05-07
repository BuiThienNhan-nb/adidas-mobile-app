import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingDetail extends StatelessWidget {
  const ShippingDetail({
    Key? key,
    required Future<bool> Function()? onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: "SHIPPING"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
