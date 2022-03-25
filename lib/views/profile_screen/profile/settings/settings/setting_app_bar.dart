import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingAppBar extends StatelessWidget implements PreferredSize {
  const SettingAppBar({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kBackgroundColor,
      centerTitle: false,
      shadowColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: AppColor.kIconBackgroundColor,
      ),
      title: Text(
        _title,
        style: AppStyle.titleTextStyle,
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
