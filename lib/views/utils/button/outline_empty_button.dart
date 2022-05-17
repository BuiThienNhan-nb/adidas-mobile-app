import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/palette.dart';
import '../../../configs/size.dart';

class OutlineShadowButton extends StatelessWidget {
  OutlineShadowButton({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final double height = 52.h;
  final double width = 320.w;
  final String content;
  final Function onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onTap,
        child: SizedBox(
          height: height * 1.4,
          width: width * 1.2,
          child: Stack(
            children: [
              Positioned(
                left: 8.w,
                top: 8.h,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.backgroundColor),
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                color: AppColors.backgroundColor,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      content,
                      style: GoogleFonts.cantarell(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.titleFontSize - 5,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/arrow_right.png',
                      width: width / 12,
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
