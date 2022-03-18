import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBarProvider extends ChangeNotifier {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get controller => _controller;
  setController(int index) {
    _controller.index = index;
    notifyListeners();
  }
}
