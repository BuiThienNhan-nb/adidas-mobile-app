import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/size.dart';
import '../../../../../../configs/style.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSize {
  const CheckoutAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      shadowColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      centerTitle: false,
      title: Text(
        "CHECKOUT",
        style: AppStyles.titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            size: AppSizes.navBarIconSize + 8,
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
