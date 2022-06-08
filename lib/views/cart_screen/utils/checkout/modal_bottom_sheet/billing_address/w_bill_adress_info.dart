import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';
import 'package:flutter_adidas_clone/view_models/order_view_model/order_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BillingAddressInformation extends StatelessWidget {
  const BillingAddressInformation({
    Key? key,
    required this.userAddress,
  }) : super(key: key);

  final UserAddress userAddress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(context.read<OrderProvider>().order.userAddress.receptionName),
          Text(
            context.read<OrderProvider>().order.userAddress.address,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
