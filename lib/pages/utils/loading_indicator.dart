import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    required String content,
  })  : _content = content,
        super(key: key);

  final String _content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 140.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_content),
            const LinearProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColor.kIconBackgroundColor),
              backgroundColor: AppColor.kBackgroundColor,
              minHeight: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
