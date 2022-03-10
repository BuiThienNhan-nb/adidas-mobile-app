import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primary: AppColor.kButtonOnClick,
      ),
      child: Container(
        height: 40.h,
        width: 350.w,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.kIconBackgroundColor),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Text(
              _content,
              style: GoogleFonts.cantarell(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: AppSize.titleFontSize - 5,
              ),
            ),
            const Spacer(),
            const FaIcon(
              FontAwesomeIcons.arrowRight,
              color: AppColor.kBackgroundColor,
              size: AppSize.appBarIconSize,
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}
