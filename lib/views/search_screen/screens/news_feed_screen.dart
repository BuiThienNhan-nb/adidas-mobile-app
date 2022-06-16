import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/view_models/product_view_model/product_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../models/product_type.dart';
import '../../../service/data_repository.dart';
import '../../utils/button/option_text_button.dart';
import '../../utils/widget/app_bar.dart';
import '../utils/w_explore_heading.dart';
import '../utils/w_explore_item.dart';
import '../utils/store/w_explore_store_banner.dart';
import '../utils/w_search_bar.dart';
import '../../utils/mock_data.dart';
import 'category/category_screen.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);
  static const String heroWidgetTag = 'searchBar';

  @override
  Widget build(BuildContext context) {
    fetchProduct(context);

    String _content = "Loading...";
    AppMockData searchScreenMockData = AppMockData();

    final Product product = Product(
      imageUrls: [
        'https://assets.adidas.com/images/w_276,h_276,f_auto,q_auto,fl_lossy,c_fill,g_auto/329bbd5423a9422b8830ae120157fbf0_9366/GY5969_01_standard.jpg'
      ],
      tag: "NEW",
      price: 2500000,
      name: "STAN SMITH",
      isFavorite: false,
      id: 'fake',
      productCategory: [],
      productType: ProductType(
        id: 'id',
        name: 'SHOES',
        categories: [],
      ),
    );
    final List<Product> products = [
      product,
      product,
      product,
      product,
      product,
    ];
    final double listHeight = 260.h;

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
            Hero(
              tag: heroWidgetTag,
              child: SearchBar(
                isNext: true,
                onSearchTap: () {},
              ),
            ),
            OptionTextButton(
              content: searchScreenMockData.shoes.name,
              function: () {
                // log(searchScreenMockData.shoes.toString());
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) =>
                        CategoryScreen(productType: searchScreenMockData.shoes),
                  ),
                );
              },
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
              height: listHeight,
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
              height: listHeight,
              child: ListView.builder(
                shrinkWrap: true,
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
              height: listHeight,
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
              height: listHeight,
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

  Future<void> fetchProduct(BuildContext context) async {
    context.read<ProductProvider>().listProduct =
        await DataRepository().getListProduct();
  }
}
