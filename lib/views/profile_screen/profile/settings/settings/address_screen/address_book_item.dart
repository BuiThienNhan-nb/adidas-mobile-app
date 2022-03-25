import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/add_new_address_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressBookItem extends StatelessWidget {
  const AddressBookItem({
    Key? key,
    required String name,
    required String address,
    required String country,
    required String phoneNumber,
  })  : _name = name,
        _address = address,
        _country = country,
        _phoneNumber = phoneNumber,
        super(key: key);
  final String _name, _address, _country, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.kGreyBackground),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_name),
                  Text(_address),
                  Text(_country),
                  Text(_phoneNumber),
                ],
              ),
            ),
            Container(
              color: AppColor.kGreyBackground,
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
                  color: AppColor.kIconBackgroundColor,
                  size: AppSize.appBarIconSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
