import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOption extends StatelessWidget {
  const SettingOption({
    Key? key,
    required String content,
    required Function() function,
  })  : _content = content,
        _function = function,
        super(key: key);
  final String _content;
  final Function() _function;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _function,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
              child: Row(
                children: [
                  Text(
                    _content,
                    style: AppStyles.boldRegularTextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.iconBackgroundColor,
                  )
                ],
              ),
            ),
            Container(
              color: AppColors.greyBackground,
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
