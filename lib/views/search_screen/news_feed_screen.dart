import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_adidas_clone/views/utils/widget/loading_indicator.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _content = "Loading...";
    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: false,
        title: "SHOP",
      ),
      body: Container(
        color: Colors.white,
        child: LoadingIndicator(content: _content),
      ),
    );
  }
}
