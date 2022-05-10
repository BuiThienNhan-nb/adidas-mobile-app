import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({
    Key? key,
    required String title,
    required Widget content,
    required Function() onTap,
  })  : _title = title,
        _content = content,
        _onTap = onTap,
        super(key: key);
  final String _title;
  final Widget _content;
  final Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppColors.iconBackgroundColor,
      ),
      onPressed: _onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _title,
                style: TextStyle(
                  color: AppColors.subTitleText,
                  fontSize: AppSizes.mediumText,
                ),
              ),
              _content,
            ],
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }
}
