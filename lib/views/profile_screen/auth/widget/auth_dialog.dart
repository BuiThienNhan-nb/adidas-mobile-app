import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/style.dart';
import '../../../utils/button/my_text_button.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({
    Key? key,
    required String title,
    required String subTitle,
    required String btnTitle,
    this.onTap,
  })  : _title = title,
        _subTitle = subTitle,
        _btnTitle = btnTitle,
        super(key: key);
  final String _title;
  final String _subTitle;
  final String _btnTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: AppColors.iconBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.backgroundColor,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _title,
                  style: AppStyles.titleTextStyle,
                ),
                SizedBox(height: 10.h),
                Text(_subTitle),
              ],
            ),
          ),
          MyTextButton(
            function:
                onTap == null ? () => Navigator.of(context).pop() : onTap!,
            content: _btnTitle,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
