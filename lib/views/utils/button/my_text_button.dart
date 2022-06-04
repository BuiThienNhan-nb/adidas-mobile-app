import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/palette.dart';
import '../../../configs/size.dart';
import '../widget/loading_indicator.dart';

// ignore: must_be_immutable
class MyTextButton extends StatelessWidget {
  MyTextButton({
    Key? key,
    required Function() function,
    required String content,
    required bool isLoading,
    this.icon = const FaIcon(
      FontAwesomeIcons.arrowRight,
      color: AppColors.whiteColor,
      size: AppSizes.appBarIconSize,
    ),
    this.buttonStyle,
    this.contentStyle,
  })  : _function = function,
        _content = content,
        _isLoading = isLoading,
        super(key: key);

  final Function() _function;
  final String _content;
  final bool _isLoading;
  final ButtonStyle? buttonStyle;
  final TextStyle? contentStyle;

  Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isLoading ? () {} : _function,
      style: buttonStyle ??
          TextButton.styleFrom(
            backgroundColor: _isLoading ? AppColors.nobelColor : Colors.black,
            padding: EdgeInsets.zero,
            primary: AppColors.nobelColor,
          ),
      child: Container(
        height: 40.h,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: _isLoading ? AppColors.nobelColor : Colors.black),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            _isLoading
                ? LoadingIndicator(
                    content: "Loading...",
                    valueColor: AppColors.whiteColor,
                    backgroundColor: AppColors.nobelColor,
                  )
                : Text(
                    _content,
                    style: contentStyle ??
                        GoogleFonts.cantarell(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.titleFontSize - 5,
                        ),
                  ),
            const Spacer(),
            icon,
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
