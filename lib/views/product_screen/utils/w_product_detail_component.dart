import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/views/cart_screen/utils/checkout/modal_bottom_sheet/payment/w_payment_select.dart';
import 'package:flutter_adidas_clone/views/product_screen/screens/size_guide_screen.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/format.dart';
import '../../../configs/palette.dart';
import '../../../configs/style.dart';

Row productName(
    String productName, int productPrice, int iconIndex, Function() onTap) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 20.w),
      SizedBox(
        width: 240.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: AppStyles.boldLargeTextStyle,
            ),
            SizedBox(height: 12.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${AppFormat.currencyFormat.format(productPrice)} đ',
                    style: AppStyles.boldSmallTextStyle,
                  ),
                  TextSpan(
                    text: '\t\t\t\t\tPERFORMANCE',
                    style: AppStyles.smallTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Spacer(),
      const FavoriteIcon(),
      SizedBox(width: 20.w),
    ],
  );
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isLike = !isLike;
        log('Favorite Icon Clicked - isLike: $isLike');
      }),
      child: isLike
          ? Image.asset(
              'assets/icons/heart_icon.png',
              height: 24.h,
              width: 28.w,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/icons/heart_icon_light.png',
              height: 24.h,
              width: 28.w,
              fit: BoxFit.fill,
            ),
    );
  }
}

Column productSizes(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            Text('SIZE', style: AppStyles.boldRegularTextStyle),
            SizedBox(width: 12.w),
            Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (BuildContext context) =>
                          const SizeGuideScreen(),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.iconBackgroundColor,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/ruler_icon.png',
                      height: 8.h,
                      width: 24.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 32.h,
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List<String> sizes = [
                '5.5 UK',
                '6 UK',
                '6.5 UK',
                '7 UK',
                '7.5 UK',
                '8 UK',
                '8.5 UK',
                '9 UK',
                '10 UK',
                '10.5 UK',
                '11 UK',
                '11.5 UK'
              ];
              return Text(
                '\t\t\t${sizes[index]}\t\t\t',
                style: AppStyles.regularTextStyle,
              );
            },
          ),
        ),
      ],
    );

Padding purchaseProduct() => Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextButton(
            function: () {},
            content: 'ADD TO BAG',
            isLoading: false,
            buttonStyle: TextButton.styleFrom(
              backgroundColor: AppColors.backgroundColor,
              padding: EdgeInsets.zero,
              primary: AppColors.buttonOnClick,
            ),
            contentStyle: AppStyles.boldRegularTextStyle,
            icon: Image.asset('assets/icons/cart_add_icon.png'),
          ),
          SizedBox(height: 8.h),
          MyTextButton(
            function: () {},
            content: 'BUY IT NOW',
            isLoading: false,
            contentStyle: AppStyles.whiteBoldRegularTextStyle,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CashOnDelivery(
                height: 24.h,
                width: 56.w,
                textStyle: AppStyles.extraXSmallTextStyle,
              ),
              SizedBox(width: 12.w),
              Image.asset(
                'assets/images/visa.png',
                height: 24.h,
                width: 56.w,
              ),
            ],
          ),
        ],
      ),
    );

Padding productInfo() {
  TextStyle spanTextStyle = TextStyle(
    decoration: TextDecoration.underline,
    decorationThickness: 1.4,
    decorationColor: AppColors.iconBackgroundColor,
    fontWeight: FontWeight.bold,
    fontSize: AppSizes.smallText,
  );

  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DIGITALLY CODED RUNNING SHOES MADE WITH PARLEY FOR THE OCEANS.',
          style: AppStyles.boldLargeTextStyle,
        ),
        SizedBox(height: 8.h),
        Text(
          'Every mile completed and every running goal accomplished starts with that first step. Lace into these adidas shoes and get going. The lattice midsole is precisely tuned to move your energy forward and make all your steps feel a little easier.\n\nEducate and act. Head to Parley for the Oceans website to find out more, sign up and get involved at adidas.com/parley.',
          style: AppStyles.smallTextStyle,
        ),
        SizedBox(height: 8.h),
        Text.rich(
          TextSpan(
            text: 'SPECIFICATIONS',
            style: spanTextStyle,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          'QUESTIONS?',
          style: AppStyles.boldLargeTextStyle,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.question_answer, size: 28.w),
                SizedBox(height: 4.h),
                Text('Chat with an agent', style: AppStyles.smallTextStyle),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(bottom: 4.h),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0)),
                    ),
                    child:
                        Text('START CHAT', style: AppStyles.boldSmallTextStyle),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.question_mark, size: 28.w),
                SizedBox(height: 4.h),
                Text('Visit our help section', style: AppStyles.smallTextStyle),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(bottom: 4.h),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0)),
                    ),
                    child:
                        Text('FAQ & HELP', style: AppStyles.boldSmallTextStyle),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
