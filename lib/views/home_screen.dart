import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../configs/palette.dart';
import '../configs/routes.dart';
import '../view_models/bot_nav_bar_view_model.dart';
import 'cart_screen/cart_screen.dart';
import 'popular_screen/popular_product_screen.dart';
import 'search_screen/screens/news_feed_screen.dart';
import 'wishlist_screen/wishlist_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Nav Bottom Bar material
    final List<Widget> _screens = [
      const PopularProductScreen(),
      const NewsFeedScreen(),
      const WishListScreen(),
      const ShoppingCartScreen(),
    ];
    final _navBarItems = <PersistentBottomNavBarItem>[
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          child: Image.asset('assets/icons/flame_icon.png'),
          scale: 1.1,
        ),
        inactiveIcon: Image.asset('assets/icons/flame_icon_light.png'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          child: Image.asset('assets/icons/search_icon.png'),
          scale: 1.1,
        ),
        inactiveIcon: Image.asset('assets/icons/search_icon_light.png'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        // icon: const FaIcon(
        //   FontAwesomeIcons.solidHeart,
        //   size: AppSizes.navBarIconSize,
        // ),
        // activeColorPrimary: Colors.black,
        // inactiveColorPrimary: CupertinoColors.systemGrey2,
        icon: Transform.scale(
          child: Image.asset('assets/icons/heart_icon.png'),
          scale: 1.1,
        ),
        inactiveIcon: Image.asset('assets/icons/heart_icon_light.png'),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          child: Image.asset('assets/icons/cart_icon.png'),
          scale: 1.1,
        ),
        inactiveIcon: Image.asset('assets/icons/cart_icon_light.png'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
    ];

    final _navBarHeight = 44.h;

    return PersistentTabView(
      context,
      screens: _screens,
      items: _navBarItems,
      controller: context.read<NavBarProvider>().controller,
      confineInSafeArea: true,
      popActionScreens: PopActionScreensType.all,
      backgroundColor: AppColors.backgroundColor,
      navBarHeight: _navBarHeight,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      padding: NavBarPadding.only(top: 12.h, bottom: 12.h),
      bottomScreenMargin: _navBarHeight + 0.4.h,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.grey,
      ),
    );
  }
}
