import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static final TextStyle titleTextStyle = GoogleFonts.cantarell(
    color: AppColor.kIconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSize.appBarIconSize,
  );
  static final TextStyle whiteTitleTextStyle = GoogleFonts.cantarell(
    color: AppColor.kBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSize.appBarIconSize,
  );
}
