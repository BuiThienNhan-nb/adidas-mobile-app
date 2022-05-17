import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

// ignore: must_be_immutable
class LoadingIndicator extends StatelessWidget {
  Color valueColor = AppColors.iconBackgroundColor;
  Color backgroundColor = AppColors.backgroundColor;

  LoadingIndicator({
    Key? key,
    this.valueColor = AppColors.iconBackgroundColor,
    this.backgroundColor = AppColors.backgroundColor,
    required String content,
  })  : _content = content,
        super(key: key);

  final String _content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _content,
              style: TextStyle(color: valueColor),
            ),
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(valueColor),
              backgroundColor: backgroundColor,
              minHeight: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
