import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Smooth Page Indicator Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: PackageTest(),
//     );
//   }
// }

class PackageTest extends StatefulWidget {
  static const String id = "PackageTestScreen";

  const PackageTest({Key? key}) : super(key: key);
  @override
  _PackageTestState createState() => _PackageTestState();
}

class _PackageTestState extends State<PackageTest> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      6,
      (index) => Image.asset(
        'assets/images/4dfwd_x_parley_ads.jpg',
        fit: BoxFit.fill,
      ),
      // (index) => Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(0),
      //     border: Border.all(color: Colors.black),
      //     color: Colors.grey.shade300,
      //   ),
      //   // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

      //   child: Center(
      //     child: Text(
      //       "Page $index",
      //       style: const TextStyle(color: Colors.indigo),
      //     ),
      //   ),
      // ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              SizedBox(
                height: 360.h,
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  'Worm',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                axisDirection: Axis.vertical,
                effect: CustomizableEffect(
                  spacing: 8.h,
                  activeDotDecoration: DotDecoration(
                    width: 16.w,
                    height: 4.h,
                    color: AppColors.iconBackgroundColor,
                  ),
                  dotDecoration: DotDecoration(
                    width: 1.6.w,
                    height: 4.h,
                    color: AppColors.iconBackgroundColor,

                    // rotationAngle: 180,
                    // verticalOffset: -10,
                    // borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
