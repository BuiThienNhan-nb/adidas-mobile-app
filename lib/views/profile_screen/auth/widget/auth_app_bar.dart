import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppBar extends StatelessWidget implements PreferredSize {
  const AuthAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {},
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.settings_outlined,
            color: AppColors.backgroundColor,
            size: AppSizes.appBarIconSize + 12,
          ),
        ),
      ),
      title: Text(
        "SETTINGS",
        style: AppStyles.whiteTitleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.close,
            size: AppSizes.navBarIconSize + 12,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
