import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';

class EmptyOrderScreen extends StatelessWidget {
  const EmptyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.box,
              size: 70,
            ),
            SizedBox(height: 10.h),
            Text(
              "NO ORDERS YET",
              style: AppStyles.titleTextStyle,
            ),
            SizedBox(height: 10.h),
            const Text(
              "You haven't placed any orders yet.",
              style: TextStyle(color: AppColors.buttonOnClick),
            ),
            SizedBox(height: 20.h),
            const Text(
              "The Adidas app features news and personally tailored content. Exclusive products, seamless one-touch ordering and live chat, so we are always there to help.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
