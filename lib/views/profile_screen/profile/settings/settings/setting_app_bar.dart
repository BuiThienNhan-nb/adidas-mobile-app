import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/palette.dart';
import '../../../../../configs/style.dart';

class SettingAppBar extends StatelessWidget implements PreferredSize {
  const SettingAppBar({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      centerTitle: false,
      bottomOpacity: 0.0,
      elevation: 0.0,
      shadowColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      title: Text(
        _title,
        style: AppStyles.titleTextStyle,
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
