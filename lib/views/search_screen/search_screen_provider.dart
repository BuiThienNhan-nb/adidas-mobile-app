import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/first_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen/search_result_screen.dart';

class SearchScreenProvider extends ChangeNotifier {
  late List<Product> _products;

  final TextEditingController _txtController = TextEditingController();
  final List<Widget> _pages = [
    const FirstLandingSearchScreen(),
    const SearchResultScreen(),
  ];
  int _currentPage = 0;
  bool _isSearching = true;

  TextEditingController get txtController => _txtController;
  int get currentPage => _currentPage;
  List<Widget> get pages => _pages;

  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  updateText(String value) {
    _txtController.text = value;
    notifyListeners();
  }

  onSubmitSearch() {
    if (_txtController.text == '') return;
    _currentPage = 1;
    _pages[1] = const SearchResultScreen();
    log('submit search');
    notifyListeners();
    log('[SEARCH] on submit: ${_txtController.text}');
  }
}
