import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/routes.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/view_models/bot_nav_bar_view_model.dart';
import 'package:flutter_adidas_clone/views/cart_screen/cart_screen.dart';
import 'package:flutter_adidas_clone/views/popular_screen/popular_product_screen.dart';
import 'package:flutter_adidas_clone/views/wishlist_screen/wishlist_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'search_screen/news_feed_screen.dart';

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
        icon: const FaIcon(
          FontAwesomeIcons.fire,
          size: AppSizes.navBarIconSize,
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(
          FontAwesomeIcons.search,
          size: AppSizes.navBarIconSize,
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(
          FontAwesomeIcons.solidHeart,
          size: AppSizes.navBarIconSize,
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(
          FontAwesomeIcons.shoppingCart,
          size: AppSizes.navBarIconSize,
        ),
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
      padding: NavBarPadding.only(
        top: 12.h,
      ),
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
