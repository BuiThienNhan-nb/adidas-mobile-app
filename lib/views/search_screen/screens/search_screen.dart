import 'package:flutter/material.dart';

import '../../../configs/palette.dart';
import '../utils/w_search_bar.dart';
import 'news_feed_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(
              tag: NewsFeedScreen.heroWidgetTag,
              child: SearchBar(isNext: false),
            ),
            Expanded(
              child: Container(
                color: AppColors.silverColor,
                child: const Center(
                  child: Text('Find your product here...'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
