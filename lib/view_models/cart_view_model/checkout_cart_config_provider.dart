import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutCartConfigProvider extends ChangeNotifier {
  bool _isNextPage = false;
  int _currentSection = 0;
  int _currentPageIndex = 0;
  double _bottomSheetHeight = 540.h;

  bool get isNextPage => _isNextPage;
  int get currentSection => _currentSection;
  int get currentPageIndex => _currentPageIndex;
  double get bottomSheetHeight => _bottomSheetHeight;

  set isNextPage(bool val) {
    _isNextPage = val;
    notifyListeners();
  }

  set currentSection(int val) {
    _currentSection = val;
    notifyListeners();
  }

  set currentPageIndex(int val) {
    _currentPageIndex = val;
    notifyListeners();
  }

  set bottomSheetHeight(double val) {
    _bottomSheetHeight = val;
    notifyListeners();
  }

  onPageTransition(bool isNextPage, int currentSection, double height) {
    _bottomSheetHeight = height;
    _isNextPage = isNextPage;
    if (currentSection >= 0) {
      _currentSection = currentSection;
    }
    if (_currentPageIndex != 0) {
      _isNextPage ? _currentPageIndex++ : _currentPageIndex--;
    }
    notifyListeners();
  }
}
