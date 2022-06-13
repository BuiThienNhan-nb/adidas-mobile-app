import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShippingInformation extends StatelessWidget {
  const ShippingInformation({
    Key? key,
    required this.userAddress,
  }) : super(key: key);

  final UserAddress? userAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 260.w,
          child: const Text(
            "Due to the impact of Covid-19, please expect theeeeeee",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 6.h),
        const Text("DELIVERY - FREE"),
        Text(context.read<OrderProvider>().order?.userAddress.receptionName ??
            ''),
        Text(context.read<OrderProvider>().order?.userAddress.address ?? ''),
      ],
    );
  }
}
