import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/cart_screen/empty_cart_widget.dart';
import 'package:flutter_adidas_clone/views/utils/app_bar.dart';

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
