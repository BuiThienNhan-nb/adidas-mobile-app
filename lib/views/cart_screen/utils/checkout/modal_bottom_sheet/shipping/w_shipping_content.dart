import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingInformation extends StatelessWidget {
  const ShippingInformation({
    Key? key,
  }) : super(key: key);

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
        const Text("Bui Thien Nhan"),
        const Text("05/66 Phan Dang Luu"),
      ],
    );
  }
}
