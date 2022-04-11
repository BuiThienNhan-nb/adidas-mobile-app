import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle titleTextStyle = GoogleFonts.cantarell(
    color: AppColors.kIconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.appBarIconSize,
  );

  static final TextStyle regularTextStyle = GoogleFonts.cantarell(
    color: AppColors.kIconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.smallText,
  );

  static final TextStyle whiteTitleTextStyle = GoogleFonts.cantarell(
    color: AppColors.kBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.appBarIconSize,
  );
}
