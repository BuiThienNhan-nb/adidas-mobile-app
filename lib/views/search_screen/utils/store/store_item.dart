import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/models/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../configs/style.dart';

class StoreItem extends StatelessWidget {
  const StoreItem({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('[STORE ITEM] clicked!');
        String query = Uri.encodeComponent(store.address);
        String ggMapUrlByStoreAddress =
            "https://www.google.com/maps/search/?api=1&query=$query";
        // ignore: deprecated_member_use
        launch(ggMapUrlByStoreAddress);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300.w,
                  child: RichText(
                    text: TextSpan(
                      style: AppStyles.regularTextStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: '${store.name}\n',
                          style: AppStyles.boldRegularTextStyle,
                        ),
                        TextSpan(
                            text:
                                '0${store.openTime}:00 - ${store.closeTime}:00\n'),
                        TextSpan(text: store.address),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 1.h,
              color: AppColors.silverColor,
            ),
          ],
        ),
      ),
    );
  }
}
