import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/views/profile_screen/auth/auth_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar(
      {Key? key, required String title, required bool isPopularScreen})
      : _title = title,
        _isPopularScreen = isPopularScreen,
        super(key: key);
  final String _title;
  final bool _isPopularScreen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kBackgroundColor,
      centerTitle: false,
      title: Text(
        _title,
        style: AppStyle.titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: _isPopularScreen
              ? const FaIcon(
                  FontAwesomeIcons.search,
                  color: AppColor.kIconBackgroundColor,
                  size: AppSize.appBarIconSize,
                )
              : Container(),
        ),
        IconButton(
          onPressed: () => context.read<AuthProvider>().isLogin
              ? Navigator.of(context, rootNavigator: true)
                  .pushNamed(ProfileScreen.id)
              : Navigator.of(context, rootNavigator: true)
                  .pushNamed(AuthScreen.id),
          icon: const FaIcon(
            FontAwesomeIcons.user,
            color: AppColor.kIconBackgroundColor,
            size: AppSize.appBarIconSize + 2,
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
