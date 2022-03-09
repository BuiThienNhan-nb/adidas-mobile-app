import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_adidas_clone/config/size.dart';
import 'package:flutter_adidas_clone/config/style.dart';
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
        icon: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.settings_outlined,
            color: AppColor.kBackgroundColor,
            size: AppSize.appBarIconSize + 12,
          ),
        ),
      ),
      title: Text(
        "SETTINGS",
        style: AppStyle.whiteTitleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            size: AppSize.navBarIconSize + 12,
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
