import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

// ignore: implementation_imports

import '../configs/palette.dart';
import '../configs/routes.dart';
import '../configs/style.dart';
import '../view_models/bot_nav_bar_view_model.dart';
import '../view_models/order_view_model/order_provider.dart';
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
      WishListScreen(appContext: context),
      ShoppingCartScreen(appContext: context),
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
        icon: Badge(
          padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
          badgeContent: Text(
            context.watch<OrderProvider>().order.orderItems.length.toString(),
            style: AppStyles.whiteSmallTextStyle,
          ),
          animationType: BadgeAnimationType.scale,
          shape: BadgeShape.square,
          position: BadgePosition.bottomEnd(),
          badgeColor: AppColors.blackColor,
          child: Transform.scale(
            child: Image.asset('assets/icons/heart_icon.png'),
            scale: 1.1,
          ),
        ),
        inactiveIcon: Badge(
          shape: BadgeShape.square,
          padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
          badgeContent: Text(
            context.watch<OrderProvider>().order.orderItems.length.toString(),
            style: AppStyles.whiteSmallTextStyle,
          ),
          animationType: BadgeAnimationType.scale,
          // shape: BadgeShape.square,
          position: BadgePosition.bottomEnd(),
          badgeColor: AppColors.blackColor,
          child: Image.asset('assets/icons/heart_icon_light.png'),
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
          padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
          badgeContent: Text(
            context.watch<OrderProvider>().order.orderItems.length.toString(),
            style: AppStyles.whiteSmallTextStyle,
          ),
          animationType: BadgeAnimationType.scale,
          shape: BadgeShape.square,
          position: BadgePosition.bottomEnd(),
          badgeColor: AppColors.blackColor,
          child: Transform.scale(
            child: Image.asset('assets/icons/cart_icon.png'),
            scale: 1.1,
          ),
        ),
        inactiveIcon: Badge(
          shape: BadgeShape.square,
          padding: EdgeInsets.fromLTRB(4.w, 0.h, 4.w, 0.h),
          badgeContent: Text(
            context.watch<OrderProvider>().order.orderItems.length.toString(),
            style: AppStyles.whiteSmallTextStyle,
          ),
          animationType: BadgeAnimationType.scale,
          // shape: BadgeShape.square,
          position: BadgePosition.bottomEnd(),
          badgeColor: AppColors.blackColor,
          child: Image.asset('assets/icons/cart_icon_light.png'),
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
      backgroundColor: AppColors.whiteColor,
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
