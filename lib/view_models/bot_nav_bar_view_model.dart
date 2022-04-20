import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBarProvider extends ChangeNotifier {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  late BuildContext _context;

  BuildContext get navBarContainerContext => _context;

  set navBarContainerContext(BuildContext context) {
    _context = context;
    notifyListeners();
  }

  PersistentTabController get controller => _controller;
  setController(int index) {
    _controller.index = index;
    notifyListeners();
  }
}
