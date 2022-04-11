import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoadingIndicator extends StatelessWidget {
  Color valueColor = AppColors.kIconBackgroundColor;
  Color backgroundColor = AppColors.kBackgroundColor;

  LoadingIndicator({
    Key? key,
    this.valueColor = AppColors.kIconBackgroundColor,
    this.backgroundColor = AppColors.kBackgroundColor,
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
