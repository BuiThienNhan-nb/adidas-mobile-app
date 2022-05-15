import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/utils/widget/span_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreHeading extends StatelessWidget {
  const ExploreHeading({
    Key? key,
    required String title,
    required Function onTap,
  })  : _title = title,
        _onTap = onTap,
        super(key: key);

  final String _title;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40.w, 24.h, 16.w, 24.h),
      child: Row(
        children: [
          Text(
            _title,
            style: AppStyles.titleTextStyle,
          ),
          const Spacer(),
          MyTextSpan(
            contentText1: '',
            linkText1: 'SEE ALL',
            contentText2: '',
            linkText2: '',
            onTap1: _onTap,
            onTap2: () {},
          ),
        ],
      ),
    );
  }
}
