import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'palette.dart';
import 'size.dart';

class AppStyles {
  static final TextStyle titleTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.appBarIconSize,
  );

  static final TextStyle boldSmallTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.smallText,
  );

  static final TextStyle regularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.mediumText,
  );

  static final TextStyle smallTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.smallText,
  );

  static final TextStyle extraXSmallTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.extraSmallText - 4.sp,
  );

  static final TextStyle boldRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.mediumText,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteBoldRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.backgroundColor,
    fontSize: AppSizes.mediumText,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle boldLargeTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.largeText,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle boldItalicRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.regularText,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle italicMediumTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.mediumText,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle italicSmallTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.smallText,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle whiteTitleTextStyle = GoogleFonts.cantarell(
    color: AppColors.backgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.appBarIconSize,
  );

  static final TextStyle whiteRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.backgroundColor,
    fontSize: AppSizes.mediumText,
  );

  static final TextStyle italicWhiteRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.backgroundColor,
    fontSize: AppSizes.regularText,
    fontStyle: FontStyle.italic,
  );
}
