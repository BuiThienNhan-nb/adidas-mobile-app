import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/models/order.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/format.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    int currentStep = 2;
    // switch (order.orderStatus) {
    //   case AppOrderStatus.delivering:
    //     currentStep = 1;
    //     break;
    //   case AppOrderStatus.complete:
    //     currentStep = 2;
    //     break;
    //   case AppOrderStatus.cancel:
    //     currentStep = 3;
    //     break;
    //   default:
    //     currentStep = 0;
    //     break;
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Text(
                'ORDER #P671Z962H',
                style: AppStyles.boldLargeTextStyle,
              ),
              SizedBox(height: 24.h),
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
              RichText(
                text: TextSpan(
                  style: AppStyles.regularTextStyle,
                  children: <TextSpan>[
                    const TextSpan(text: 'Ordered: '),
                    TextSpan(
                      text: AppFormat.formatDay.format(order.orderTime),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' | ${order.orderItems.length} item(s) | '),
                    TextSpan(
                      text: '${AppFormat.currencyFormat.format(order.total)}đ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 1.6.h,
                color: AppColors.silverColor,
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 72.h,
                width: double.infinity,
                child: Stepper(
                  controlsBuilder: (context, details) =>
                      const SizedBox.shrink(),
                  type: StepperType.horizontal,
                  elevation: 0,
                  currentStep: currentStep,
                  steps: [
                    Step(
                      title: currentStep == 0
                          ? SizedBox(
                              width: 164.w,
                              child: const Text(
                                'Order confirmed, waiting to be packed',
                              ),
                            )
                          : const SizedBox.shrink(),
                      content: const SizedBox.shrink(),
                      isActive: currentStep >= 0,
                    ),
                    Step(
                      title: currentStep == 1
                          ? SizedBox(
                              width: 164.w,
                              child: const Text(
                                'Unfortunately, Your order has been canceled because of some reasons!',
                              ),
                            )
                          : const SizedBox.shrink(),
                      content: const SizedBox.shrink(),
                      isActive: currentStep >= 1,
                    ),
                    Step(
                      title: currentStep == 2
                          ? SizedBox(
                              width: 164.w,
                              child: const Text(
                                'Order has been delivered, can be quite long in some case.',
                              ),
                            )
                          : const SizedBox.shrink(),
                      content: const SizedBox.shrink(),
                      isActive: currentStep >= 2,
                    ),
                    Step(
                      title: currentStep == 3
                          ? SizedBox(
                              width: 164.w,
                              child: const Text(
                                'Order has been received and purchased! Glad to be of service.',
                              ),
                            )
                          : const SizedBox.shrink(),
                      content: const SizedBox.shrink(),
                      isActive: currentStep >= 3,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 1.6.h,
                color: AppColors.silverColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 36.h),
        Container(
          height: 2.h,
          color: AppColors.silverColor,
        ),
      ],
    );
  }
}
