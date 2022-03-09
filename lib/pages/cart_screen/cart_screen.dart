import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/pages/cart_screen/empty_cart_widget.dart';
import 'package:flutter_adidas_clone/pages/utils/app_bar.dart';
import 'package:flutter_adidas_clone/pages/utils/loading_indicator.dart';
import 'package:flutter_adidas_clone/pages/wishlist_screen/empty_list_widget.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOPPING CART",
      ),
      body: Container(
        color: Colors.white,
        child: const EmptyCartWidget(),
      ),
    );
  }
}
