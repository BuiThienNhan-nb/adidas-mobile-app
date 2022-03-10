import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/routes.dart';
import 'package:flutter_adidas_clone/pages/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() => runApp(const AdidasApp());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AdidasApp());
}

class AdidasApp extends StatelessWidget {
  const AdidasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().onGenerateRoute,
        initialRoute: HomeScreen.id,
      ),
    );
  }
}
