import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/config/palette.dart';
import 'package:flutter_adidas_clone/pages/profile_screen/auth_screen/auth_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String id = "AuthScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   constraints: const BoxConstraints.expand(),
            //   height: 300.h,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/auth-background.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset("assets/images/auth-background.jpg"),
              ),
            ),
            Container(
              height: 120.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      primary: AppColor.kButtonOnClick,
                    ),
                    child: Container(
                      height: 35.h,
                      width: 365.w,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.kIconBackgroundColor),
                      ),
                      child: const Text(
                        "L O G I N",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      primary: AppColor.kButtonOnClick,
                    ),
                    child: Container(
                      height: 35.h,
                      width: 365.w,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.kIconBackgroundColor),
                      ),
                      child: const Text(
                        "R E G I S T E R",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
