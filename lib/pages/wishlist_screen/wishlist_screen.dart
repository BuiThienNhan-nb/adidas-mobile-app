import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/pages/utils/app_bar.dart';
import 'package:flutter_adidas_clone/pages/utils/loading_indicator.dart';
import 'package:flutter_adidas_clone/pages/wishlist_screen/empty_list_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "WISHLIST",
      ),
      body: Container(
        color: Colors.white,
        child: const EmptyListWidget(),
      ),
    );
  }
}
