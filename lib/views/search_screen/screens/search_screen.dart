// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/first_screen.dart';
// import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_result_screen.dart';
// import 'package:flutter_adidas_clone/views/search_screen/search_screen_provider.dart';
// import 'package:provider/provider.dart';

// import '../utils/w_search_bar.dart';
// import 'news_feed_screen.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // List<Widget> pages = context.read<SearchScreenProvider>().pages;
//     log('SEARCH SCREEN build!');
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Hero(
//               tag: NewsFeedScreen.heroWidgetTag,
//               child: SearchBar(
//                 isNext: false,
//                 onSearchTap: () {
//                   log('[SEARCH RESULT] doing search again with ${context.read<SearchScreenProvider>().txtController.text}!');
//                   setState(() {});
//                 },
//               ),
//             ),
//             Expanded(
//                 child:
//                     context.read<SearchScreenProvider>().txtController.text ==
//                             ''
//                         ? const FirstLandingSearchScreen()
//                         : const SearchResultScreen()),
//             // Expanded(
//             //   child: PageTransitionSwitcher(
//             //     duration: const Duration(milliseconds: 400),
//             //     reverse: false,
//             //     transitionBuilder:
//             //         (child, primaryAnimation, secondaryAnimation) =>
//             //             SharedAxisTransition(
//             //       animation: primaryAnimation,
//             //       secondaryAnimation: secondaryAnimation,
//             //       transitionType: SharedAxisTransitionType.horizontal,
//             //       child: child,
//             //     ),
//             //     child: Consumer<SearchScreenProvider>(
//             //       builder: (_, __, ___) =>
//             //           pages[context.read<SearchScreenProvider>().currentPage],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/news_feed_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/first_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_failure_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_succes_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/utils/w_search_bar.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../view_models/product_view_model/product_provider.dart';
import '../../utils/widget/loading_indicator.dart';
import '../search_screen_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: NewsFeedScreen.heroWidgetTag,
              child:
                  SearchBar(isNext: false, onSearchTap: () => setState(() {})),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: context.read<ProductProvider>().getProductByName(
                    context.read<SearchScreenProvider>().txtController.text),
                builder: (context, snapshot) {
                  if (context.read<SearchScreenProvider>().txtController.text ==
                      '') {
                    return const FirstLandingSearchScreen();
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      log('search result - fail');
                      return const SearchFailureScreen();
                    }
                    log('search result - success');
                    return SearchSuccessScreen(products: snapshot.data!);
                  }
                  log('search result - load');
                  return LoadingIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
