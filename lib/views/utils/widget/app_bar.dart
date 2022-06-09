import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../../configs/palette.dart';
import '../../../configs/size.dart';
import '../../../configs/style.dart';
import '../../../view_models/auth_view_model/auth_provider.dart';
import '../../profile_screen/auth/auth_screen.dart';
import '../../profile_screen/profile/settings/profile_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({
    Key? key,
    required String title,
    required bool isPopularScreen,
    double? height,
  })  : _title = title,
        _isPopularScreen = isPopularScreen,
        _height = height,
        super(key: key);
  final String _title;
  final bool _isPopularScreen;
  final double? _height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      centerTitle: false,
      bottomOpacity: 0.0,
      elevation: 1,
      title: Text(
        _title,
        style: AppStyles.titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: _isPopularScreen
              ? const FaIcon(
                  FontAwesomeIcons.search,
                  color: AppColors.blackColor,
                  size: AppSizes.appBarIconSize,
                )
              : Container(),
        ),
        IconButton(
          // TODO: Change condition to push User profile (isLogin == true)
          onPressed: () {
            /// Mock user data
            context.read<UserProvider>().user = User(
              id: 'mock_data',
              fullName: 'Bùi Thiện Nhân',
              isVerifiedEmail: false,
              dateOfBirth: DateTime(2001, 9, 25),
              phoneNumber: '0762796747',
              email: 'buithiennhan2016@gmail.com',
            );

            !context.read<AuthProvider>().isLogin
                ? Navigator.of(context, rootNavigator: true)
                    .pushNamed(ProfileScreen.id)
                : Navigator.of(context, rootNavigator: true)
                    .pushNamed(AuthScreen.id);
          },
          icon: const FaIcon(
            FontAwesomeIcons.user,
            color: AppColors.blackColor,
            size: AppSizes.appBarIconSize + 2,
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
  Size get preferredSize =>
      _height != null ? Size.fromHeight(_height!) : Size.fromHeight(48.h);
}
