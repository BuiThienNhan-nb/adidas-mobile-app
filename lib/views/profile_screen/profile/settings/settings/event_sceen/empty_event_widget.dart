import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyEventWidget extends StatelessWidget {
  const EmptyEventWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.h, 100.h, 20.h, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.users,
              size: 70,
            ),
            SizedBox(height: 10.h),
            Text(
              "NO EVENTS TO SHOW",
              style: AppStyles.titleTextStyle,
            ),
            SizedBox(height: 10.h),
            const Text(
              "You haven't signed up to any events yet.",
              style: TextStyle(color: AppColors.kButtonOnClick),
            ),
            SizedBox(height: 20.h),
            const Text(
              "Check your feed for upcoming events. Event passes will be added here once you've signed up.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
