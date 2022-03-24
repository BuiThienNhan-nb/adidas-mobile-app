import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/routes.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/auth_provider.dart';
import 'package:flutter_adidas_clone/view_models/auth_view_model/user_provider.dart';
import 'package:flutter_adidas_clone/view_models/bot_nav_bar_view_model.dart';
import 'package:flutter_adidas_clone/view_models/cart_view_model/cart_provider.dart';
import 'package:flutter_adidas_clone/views/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AdidasApp extends StatelessWidget {
  const AdidasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: () => MultiProvider(
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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes().onGenerateRoute,
          initialRoute: HomeScreen.id,
        ),
      ),
    );
  }
}
