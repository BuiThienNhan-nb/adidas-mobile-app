import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/routes.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/view_models/banner_view_model/banner_provider.dart';
import 'package:flutter_adidas_clone/view_models/bot_nav_bar_view_model.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'configs/routes.dart';
import 'view_models/auth_view_model/auth_provider.dart';
import 'view_models/auth_view_model/user_provider.dart';
import 'view_models/bot_nav_bar_view_model.dart';
import 'view_models/cart_view_model/cart_provider.dart';
import 'view_models/cart_view_model/checkout_cart_config_provider.dart';
import 'view_models/order_view_model/order_provider.dart';
import 'views/home_screen.dart';

class AdidasApp extends StatelessWidget {
  const AdidasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (_, __) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => NavBarProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => CheckoutCartConfigProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => OrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => BannerProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: AppColors.blackColor,
                  secondary: Colors.grey.shade500,
                ),
          ),
          onGenerateRoute: AppRoutes().onGenerateRoute,
          initialRoute: HomeScreen.id,
        ),
      ),
    );
  }
}
