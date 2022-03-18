import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required Function() function,
    required String content,
    required bool isValid,
  })  : _function = function,
        _content = content,
        _isValid = isValid,
        super(key: key);

  final Function() _function;
  final String _content;
  final bool _isValid;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isValid ? _function : () {},
      style: TextButton.styleFrom(
        backgroundColor: _isValid ? Colors.black : AppColor.kButtonOnClick,
        padding: EdgeInsets.zero,
        primary: AppColor.kButtonOnClick,
      ),
      child: Container(
        height: 40.h,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: _isValid ? Colors.black : AppColor.kButtonOnClick),
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
