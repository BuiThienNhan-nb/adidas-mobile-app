import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/search_screen/utils/w_explore_heading.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../search_screen_provider.dart';
import '../../utils/w_explore_item.dart';

class SearchFailureScreen extends StatelessWidget {
  const SearchFailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppStyles.regularTextStyle,
                children: [
                  const TextSpan(
                    text: 'No results found for ',
                  ),
                  TextSpan(
                      text: context
                          .watch<SearchScreenProvider>()
                          .txtController
                          .text,
                      style: AppStyles.boldLargeTextStyle)
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Text(
                'Here are some of our recommendations!',
                style: AppStyles.regularTextStyle,
              ),
            ),
            ExploreHeading(
              title: 'TOP SELLER',
              onTap: () {},
            ),
            SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: AppMockData().products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ExploreItem(
                  products: AppMockData().products,
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
