import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/utils/button/login_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({
    Key? key,
    required String title,
    required String subTitle,
    required String btnTitle,
  })  : _title = title,
        _subTitle = subTitle,
        _btnTitle = btnTitle,
        super(key: key);
  final String _title;
  final String _subTitle;
  final String _btnTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: AppColor.kIconBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColor.kBackgroundColor,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _title,
                  style: AppStyle.titleTextStyle,
                ),
                SizedBox(height: 10.h),
                Text(_subTitle),
              ],
            ),
          ),
          AuthButton(
            function: () => Navigator.of(context).pop(),
            content: _btnTitle,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
