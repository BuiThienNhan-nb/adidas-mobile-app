import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthMethodButton extends StatelessWidget {
  const AuthMethodButton({
    Key? key,
    required FaIcon icon,
    required String title,
    required Function() onPress,
  })  : _icon = icon,
        _title = title,
        _onPress = onPress,
        super(key: key);

  final FaIcon _icon;
  final String _title;
  final Function() _onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPress,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        padding: EdgeInsets.zero,
        primary: AppColors.buttonOnClick,
      ),
      child: Container(
        height: 55.h,
        width: 500.w,
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            _icon,
            SizedBox(width: 10.w),
            Text(
              _title,
              style: GoogleFonts.cantarell(
                color: Colors.black,
                fontSize: AppSizes.titleFontSize - 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
