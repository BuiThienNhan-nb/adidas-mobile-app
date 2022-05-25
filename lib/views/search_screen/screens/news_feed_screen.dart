import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/product.dart';
import '../../utils/button/option_text_button.dart';
import '../../utils/widget/app_bar.dart';
import '../utils/w_explore_heading.dart';
import '../utils/w_explore_item.dart';
import '../utils/w_explore_store_banner.dart';
import '../utils/w_search_bar.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);
  static const String heroWidgetTag = 'searchBar';

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";

    final Product product = Product(
      imageUrl: [
        'https://assets.adidas.com/images/w_276,h_276,f_auto,q_auto,fl_lossy,c_fill,g_auto/329bbd5423a9422b8830ae120157fbf0_9366/GY5969_01_standard.jpg'
      ],
      tag: "NEW",
      price: 2500000,
      name: "STAN SMITH",
    );
    final List<Product> products = [
      product,
      product,
      product,
      product,
      product,
    ];
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOP",
      ),
      // body: Container(
      //   color: Colors.white,
      //   child: LoadingIndicator(content: _content),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(
              tag: heroWidgetTag,
              child: SearchBar(isNext: true),
            ),
            OptionTextButton(
              content: 'SHOES',
              function: () {},
            ),
            OptionTextButton(
              content: 'CLOTHING',
              function: () {},
            ),
            OptionTextButton(
              content: 'ACCESSORIES',
              function: () {},
            ),
            OptionTextButton(
              content: 'SHOP BY SPORT',
              function: () {},
            ),
            OptionTextButton(
              content: 'SHOP BY BRAND',
              function: () {},
            ),
            ExploreHeading(
              title: 'ADIZERO RUNNING',
              onTap: () {},
            ),
            SizedBox(
              height: 244.h,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ExploreItem(
                  products: products,
                  index: index,
                ),
              ),
            ),
            // SizedBox(height: 20.h),
            ExploreHeading(
              title: 'FORUM',
              onTap: () {},
            ),
            SizedBox(
              height: 244.h,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ExploreItem(
                  products: products,
                  index: index,
                ),
              ),
            ),
            // SizedBox(height: 20.h),
            ExploreHeading(
              title: 'NEW ARRIVALS',
              onTap: () {},
            ),
            SizedBox(
              height: 244.h,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ExploreItem(
                  products: products,
                  index: index,
                ),
              ),
            ),
            // SizedBox(height: 20.h),
            ExploreHeading(
              title: 'SLIDES',
              onTap: () {},
            ),
            SizedBox(
              height: 244.h,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ExploreItem(
                  products: products,
                  index: index,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            const ExploreStoreBanner(),
            // SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
