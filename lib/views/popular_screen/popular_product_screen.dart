import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_adidas_clone/views/utils/widget/loading_indicator.dart';

class PopularProductScreen extends StatelessWidget {
  const PopularProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: true,
        title: "DROPS",
      ),
      body: Container(
        color: Colors.white,
        child: LoadingIndicator(content: _content),
      ),
    );
  }
}
