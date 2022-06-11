import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/format.dart';
import 'package:flutter_adidas_clone/configs/order_status.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/models/order_item.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';
import 'package:flutter_adidas_clone/views/utils/button/my_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/style.dart';
import '../../../../models/order.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    Key? key,
    required this.title,
    required this.order,
    required this.onButtonTap,
  }) : super(key: key);

  final String title;
  final Order order;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    final UserAddress address = order.userAddress;

    return Container(
      color: AppColors.whiteColor,
      child: SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/adidas_order_background.jpg',
                  height: 240.h,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                orderInformation(title, order, address, context),
                Divider(color: AppColors.silverColor, thickness: 2.h),
                orderProductDetails(order, context),
                Divider(color: AppColors.silverColor, thickness: 2.h),
                orderTotalPayInformation(order),
                SizedBox(height: 28.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: MyTextButton(
                    function: onButtonTap,
                    content: 'CONFIRM',
                    isLoading: false,
                    icon: Image.asset(
                      'assets/icons/check_icon.png',
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget orderProductDetails(Order order, BuildContext context) => Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: ExpansionTile(
          title: Text(
            'ORDER DETAILS',
            style: AppStyles.boldLargeTextStyle,
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderItems.length,
              padding: EdgeInsets.only(bottom: 8.h),
              itemBuilder: (context, index) =>
                  orderProductDetailItem(order.orderItems[index]),
            ),
          ],
        ),
      ),
    );

Row orderProductDetailItem(OrderItem orderItem) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: orderItem.product.imageUrl.first,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 140.h,
          width: 120.w,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderItem.product.name, style: AppStyles.boldRegularTextStyle),
            SizedBox(height: 8.h),
            Text(
              '${AppFormat.currencyFormat.format(orderItem.product.price)}\t\tđ',
              style: AppStyles.smallTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              '${orderItem.quantity} ' +
                  (orderItem.quantity == 1 ? 'item' : 'items') +
                  '- size: ${orderItem.size} UK',
              style: AppStyles.subTextStyle,
            ),
          ],
        ),
      ],
    );

Padding orderTotalPayInformation(Order order) => Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Text(
            'ORDER SUMMARY',
            style: AppStyles.boldLargeTextStyle,
          ),
          SizedBox(height: 32.h),
          orderInfoItem(
            'PRODUCT(S) TOTAL',
            '${AppFormat.currencyFormat.format(order.total / 0.8)}\t\tđ',
          ),
          SizedBox(height: 16.h),
          orderInfoItem('SHIPPING', '0\t\tđ'),
          SizedBox(height: 16.h),
          orderInfoItem(
            'PROMOTIONS',
            '-${AppFormat.currencyFormat.format(order.total * 0.2)}\t\tđ',
          ),
          SizedBox(height: 16.h),
          orderInfoItem(
            'TOTAL',
            '${AppFormat.currencyFormat.format(order.total)}\t\tđ',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );

Padding orderInformation(
    String title, Order order, UserAddress address, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 28.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Text(
            title,
            style: AppStyles.boldXLargeTextStyle,
          ),
        ),
        SizedBox(height: 32.h),
        orderDetailItem('assets/icons/truck_delivery_icon.png',
            'Home Delivery\nStandard Delivery\nGHN - SPXVNN021007969754'),
        SizedBox(height: 12.h),
        orderDetailItem('assets/icons/location_marker_icon.png',
            '${address.receptionName}\n${address.receptionPhoneNumber}\n${address.address}'),
        SizedBox(height: 12.h),
        Divider(color: AppColors.silverColor, thickness: 2.h),
        SizedBox(height: 16.h),
        orderInfoItem('ORDER NUMBER', '9XFBA1BZ6904'),
        SizedBox(height: 16.h),
        Divider(color: AppColors.silverColor, thickness: 2.h),
        SizedBox(height: 16.h),
        orderInfoItem('STATUS', AppOrderStatus.processing),
        SizedBox(height: 16.h),
        Divider(color: AppColors.silverColor, thickness: 2.h),
        SizedBox(height: 16.h),
        orderInfoItem(
          'ORDER TIME',
          AppFormat.formatDateMonthTime.format(order.orderTime),
        ),
        SizedBox(height: 16.h),
        Divider(color: AppColors.silverColor, thickness: 2.h),
        SizedBox(height: 16.h),
        orderInfoItem('PAYMENT METHOD', 'Cash on Delivery'),
        SizedBox(height: 16.h),
        Divider(color: AppColors.silverColor, thickness: 2.h),
        SizedBox(height: 16.h),
        orderInfoItem('BILLING ADDRESS', address.address),
        // SizedBox(height: 16.h),
      ],
    ),
  );
}

Row orderDetailItem(String imageUrl, String content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 12.w),
      Image.asset(
        imageUrl,
        height: 28.h,
        width: 28.w,
      ),
      SizedBox(width: 28.w),
      Expanded(
        child: Text(
          content,
          style: AppStyles.regularTextStyle,
        ),
      ),
    ],
  );
}

Row orderInfoItem(String title, String content) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.subTextStyle),
        const Spacer(),
        SizedBox(
          // color: Colors.teal,
          width: 200.w,
          child: Text(
            content,
            style: AppStyles.regularTextStyle,
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
