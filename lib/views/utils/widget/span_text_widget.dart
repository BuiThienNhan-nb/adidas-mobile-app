import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

class MyTextSpan extends StatelessWidget {
  const MyTextSpan({
    Key? key,
    required String contentText1,
    required linkText1,
    required contentText2,
    required linkText2,
    required onTap1,
    required onTap2,
  })  : _contentText1 = contentText1,
        _linkText1 = linkText1,
        _contentText2 = contentText2,
        _linkText2 = linkText2,
        _onTap1 = onTap1,
        _onTap2 = onTap2,
        super(key: key);
  final String _contentText1;
  final String _linkText1;
  final String _contentText2;
  final String _linkText2;
  final Function() _onTap1;
  final Function() _onTap2;

  @override
  Widget build(BuildContext context) {
    TextStyle linkStyle = TextStyle(
      decoration: TextDecoration.underline,
      decorationThickness: 1.3,
      decorationColor: AppColors.blackColor,
      color: Colors.transparent,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: AppColors.blackColor,
          offset: Offset(0, -4.h),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
          children: <TextSpan>[
            TextSpan(text: _contentText1),
            TextSpan(
              text: _linkText1,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = _onTap1,
            ),
            TextSpan(text: _contentText2),
            TextSpan(
              text: _linkText2,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = _onTap2,
            ),
          ],
        ),
      ),
    );
  }
}
