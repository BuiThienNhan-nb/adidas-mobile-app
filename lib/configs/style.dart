import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle titleTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.appBarIconSize,
  );

  static final TextStyle smallBoldTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.smallText,
  );

  static final TextStyle regularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.mediumText,
  );

  static final TextStyle boldItalicRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.regularText,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle italicRegularTextStyle = GoogleFonts.cantarell(
    color: AppColors.iconBackgroundColor,
    fontSize: AppSizes.mediumText,
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
}
