import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/format.dart';
import '../../../../../configs/style.dart';
import '../../../../../models/order.dart';

RichText orderHistoryItemGeneralInfos(Order order) {
  return RichText(
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
  );
}

SizedBox orderProcessStepper(int currentStep) {
  return SizedBox(
    height: 72.h,
    width: double.infinity,
    child: Stepper(
      controlsBuilder: (context, details) => const SizedBox.shrink(),
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
  );
}
