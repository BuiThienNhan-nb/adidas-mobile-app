import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_adidas_clone/views/wishlist_screen/empty_list_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
