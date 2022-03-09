import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_adidas_clone/config/size.dart';
import 'package:flutter_adidas_clone/config/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);
  void onButtonClick() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "YOUR BAG IS EMPTY",
            style: AppStyle.titleTextStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text("Why is that? Let's get creative!"),
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
                "BROWSE TRENDS",
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
