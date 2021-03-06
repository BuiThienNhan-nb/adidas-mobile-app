import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/palette.dart';
import '../../../configs/size.dart';

class EmptyItemsButton extends StatelessWidget {
  const EmptyItemsButton({
    Key? key,
    required Function() function,
    required String content,
  })  : _function = function,
        _content = content,
        super(key: key);
  final Function() _function;
  final String _content;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _function,
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.zero,
        primary: AppColors.nobelColor,
      ),
      child: Container(
        height: 40.h,
        width: 350.w,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Text(
              _content,
              style: GoogleFonts.cantarell(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.titleFontSize - 5,
              ),
            ),
            const Spacer(),
            const FaIcon(
              FontAwesomeIcons.arrowRight,
              color: AppColors.whiteColor,
              size: AppSizes.appBarIconSize,
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
