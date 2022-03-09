import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_adidas_clone/config/size.dart';
import 'package:flutter_adidas_clone/config/style.dart';
import 'package:flutter_adidas_clone/pages/utils/empty_item_button.dart';
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
          EmptyItemsButton(
            function: onButtonClick,
            content: "BROWSE TRENDS",
          ),
        ],
      ),
    );
  }
}
