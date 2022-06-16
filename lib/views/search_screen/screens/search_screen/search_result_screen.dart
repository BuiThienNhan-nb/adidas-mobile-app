import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_failure_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_succes_screen.dart';
import 'package:provider/provider.dart';

import '../../../../models/product.dart';
import '../../../../view_models/product_view_model/product_provider.dart';
import '../../../utils/widget/loading_indicator.dart';
import '../../search_screen_provider.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    log('[SEARCH RESULT] build');
    return FutureBuilder<List<Product>>(
      future: context.read<ProductProvider>().getProductByName(
          context.read<SearchScreenProvider>().txtController.text),
      builder: (context, snapshot) {
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
    );
  }
}
