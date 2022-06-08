import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingAddressInformation extends StatelessWidget {
  const BillingAddressInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text("Bui Thien Nhan"),
          Text("05/66 Phan Dang Luu"),
        ],
      ),
    );
  }
}
