import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/size.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../setting_app_bar.dart';
import 'add_new_address_screen.dart';
import 'address_book_item.dart';

class AddressBookScreen extends StatelessWidget {
  static const String id = "AddressBookScreen";
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: "ADDRESS BOOK"),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => const AddressBookItem(
                        name: "Bùi Thiện Nhân",
                        address:
                            "05/66 Phan Đăng Lưu, Phường 9, Tp Tuy Hòa, tỉnh Phú Yên",
                        country: "VietNam",
                        phoneNumber: "0762796747",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextButton(
              function: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      const AddNewAddressScreen(isEdit: false),
                ),
              ),
              content: "ADD NEW ADDRESS",
              isLoading: false,
              icon: const FaIcon(
                FontAwesomeIcons.plus,
                color: AppColors.whiteColor,
                size: AppSizes.appBarIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
