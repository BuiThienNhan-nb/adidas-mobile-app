import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/view_models/bot_nav_bar_view_model.dart';
import 'package:flutter_adidas_clone/views/utils/button/empty_item_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NOTHING SAVED YET",
            style: AppStyles.titleTextStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text("Tap the heart icon to save items here for later."),
          SizedBox(
            height: 20.h,
          ),
          EmptyItemsButton(
            function: () => context.read<NavBarProvider>().setController(1),
            content: "START SHOPPING",
          ),
        ],
      ),
    );
  }
}
