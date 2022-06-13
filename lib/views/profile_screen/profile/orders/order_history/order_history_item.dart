import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/format.dart';
import '../../../../../configs/order_status.dart';
import '../../../../../configs/palette.dart';
import '../../../../../configs/style.dart';
import '../../../../../models/order.dart';
import '../../../../utils/button/my_text_button.dart';
import '../../../../utils/widget/w_network_image.dart';
import '../order_detail_screen.dart';
import 'order_history_item_components.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    int currentStep;
    switch (order.orderStatus) {
      case AppOrderStatus.delivering:
        currentStep = 1;
        break;
      case AppOrderStatus.complete:
        currentStep = 2;
        break;
      case AppOrderStatus.cancel:
        currentStep = 3;
        break;
      default:
        currentStep = 0;
        break;
    }

    return ExpansionTile(
      tilePadding: EdgeInsets.all(16.w),
      title: Text(
        'ORDER #P671Z962H',
        style: AppStyles.boldLargeTextStyle,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyTextButton(
                    function: () {},
                    content: 'CANCEL ITEMS',
                    isLoading: false,
                    icon: Image.asset(
                      'assets/icons/cross_icon.png',
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  orderHistoryItemGeneralInfos(order),
                  SizedBox(height: 16.h),
                  Container(
                    height: 1.6.h,
                    color: AppColors.silverColor,
                  ),
                  SizedBox(height: 8.h),
                  orderProcessStepper(currentStep),
                  SizedBox(height: 8.h),
                  Container(
                    height: 1.6.h,
                    color: AppColors.silverColor,
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      log('[ORDER HISTORY] item clicked!');
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => OrderDetailScreen(
                            title: 'ORDER DETAIL INFORMATION',
                            order: order,
                            onButtonTap: () => Navigator.of(context).pop(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyNetworkImage(
                          imageUrl:
                              order.orderItems.first.product.imageUrls.first,
                          size: Size(120.w, 100.h),
                        ),
                        SizedBox(width: 4.w),
                        SizedBox(
                          width: 250.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderItems.first.product.name,
                                style: AppStyles.boldRegularTextStyle,
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size: ${order.orderItems.first.size}',
                                    style: AppStyles.subTextStyle,
                                  ),
                                  Text(
                                    '${order.orderItems.first.quantity} item(s)\n${AppFormat.currencyFormat.format(order.orderItems.first.total)}\tđ',
                                    style: AppStyles.smallTextStyle,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'See ${order.orderItems.length - 1} more...',
                    textAlign: TextAlign.center,
                    style: AppStyles.italicMediumTextStyle,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Container(
              width: 220.w,
              height: 1.h,
              margin: EdgeInsets.only(right: 20.w),
              color: AppColors.silverColor,
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                'TOTAL: ${AppFormat.currencyFormat.format(order.total)}  đ',
                style: AppStyles.boldRegularTextStyle,
              ),
            ),
            SizedBox(height: 32.h),
            Container(
              height: 2.h,
              color: AppColors.silverColor,
            ),
          ],
        ),
      ],
    );
  }
}
