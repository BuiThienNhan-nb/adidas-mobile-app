import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/utils/empty_item_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          EmptyItemsButton(
            function: onButtonClick,
            content: "START SHOPPING",
          ),
        ],
      ),
    );
  }
}
