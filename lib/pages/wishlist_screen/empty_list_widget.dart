import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_adidas_clone/config/size.dart';
import 'package:flutter_adidas_clone/config/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);
  void onButtonClick() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NOTHING SAVED YET",
            style: AppStyle.titleTextStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text("Tap the heart icon to save items here for later."),
          SizedBox(
            height: 20.h,
          ),
          StartShoppingButton(
            function: onButtonClick,
          ),
        ],
      ),
    );
  }
}

class StartShoppingButton extends StatelessWidget {
  const StartShoppingButton({
    Key? key,
    required Function() function,
  })  : _function = function,
        super(key: key);
  final Function() _function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.kIconBackgroundColor,
          height: 40.h,
          width: 350.w,
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                "START SHOPPING",
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
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: AppColor.kButtonOnClick,
              onTap: _function,
            ),
          ),
        ),
      ],
    );
  }
}
