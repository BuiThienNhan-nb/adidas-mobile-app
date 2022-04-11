import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/views/utils/widget/loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DeleteAddressButton extends StatelessWidget {
  DeleteAddressButton({
    Key? key,
    required Function() function,
    required String content,
    required bool isLoading,
    this.icon = const FaIcon(
      FontAwesomeIcons.arrowRight,
      color: AppColors.kIconBackgroundColor,
      size: AppSizes.appBarIconSize,
    ),
  })  : _function = function,
        _content = content,
        _isLoading = isLoading,
        super(key: key);

  final Function() _function;
  final String _content;
  final bool _isLoading;
  Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isLoading ? () {} : _function,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.kBackgroundColor,
        padding: EdgeInsets.zero,
        primary: AppColors.kButtonOnClick,
      ),
      child: Container(
        height: 40.h,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: _isLoading ? AppColors.kButtonOnClick : Colors.black),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            _isLoading
                ? LoadingIndicator(
                    content: "Loading...",
                    valueColor: AppColors.kIconBackgroundColor,
                    backgroundColor: AppColors.kButtonOnClick,
                  )
                : Text(
                    _content,
                    style: GoogleFonts.cantarell(
                      color: AppColors.kIconBackgroundColor,
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
