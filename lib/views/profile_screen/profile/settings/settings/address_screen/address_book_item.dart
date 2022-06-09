import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/user_address.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/size.dart';
import 'add_new_address_screen.dart';

class AddressBookItem extends StatelessWidget {
  AddressBookItem({
    Key? key,
    required this.userAddress,
    this.isSelect = false,
  }) : super(key: key);
  // final String _name, _address, _country, _phoneNumber;
  final UserAddress userAddress;
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      child: Container(
        decoration: BoxDecoration(
          border: isSelect == true
              ? Border.all(color: AppColors.blackColor)
              : Border.all(color: AppColors.silverColor),
        ),
        height: 100.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 4.w),
            isSelect == true
                ? Container(
                    // padding: EdgeInsets.all(8.h),
                    color: AppColors.blackColor,
                    width: 2.w,
                    height: 92.h,
                  )
                : const SizedBox.shrink(),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userAddress.receptionName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(userAddress.address),
                  Text(userAddress.country),
                  Text(userAddress.receptionPhoneNumber),
                ],
              ),
            ),
            Container(
              color: AppColors.silverColor,
              height: 100.h,
              width: 1.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        const AddNewAddressScreen(isEdit: true),
                  ),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.pen,
                  color: AppColors.blackColor,
                  size: AppSizes.appBarIconSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
