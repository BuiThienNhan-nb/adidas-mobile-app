import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/validator.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/province_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../../configs/palette.dart';
import '../../../../../../configs/size.dart';
import '../../../../../../configs/style.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../../../../../utils/input/text_field_input.dart';
import 'delete_button.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({
    Key? key,
    required bool isEdit,
  })  : _isEdit = isEdit,
        super(key: key);
  final bool _isEdit;

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final TextEditingController txtNameController =
        TextEditingController(text: "");
    final TextEditingController txtPhoneController =
        TextEditingController(text: "0");
    final TextEditingController txtAddressController =
        TextEditingController(text: "");
    final TextEditingController txtProvinceController =
        TextEditingController(text: "");

    onProvinceTap() {
      log('ON PROVINCE TAP');
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => ProvincePicker(
          title: 'PROVINCE PICKER',
          callbackAddress: (String address) {
            log('[PROVINCE PICKER CALLBACK] current address $address');
            txtProvinceController.text = address;
          },
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          _isEdit ? "EDIT ADDRESS" : "ADD NEW ADDRESS",
          style: AppStyles.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: AppSizes.navBarIconSize + 8,
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                key: key,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: txtNameController,
                      textInputType: TextInputType.emailAddress,
                      validator: AppValidators.nameValidator,
                      labelText: "NAME",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: txtAddressController,
                      textInputType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "Address is required"),
                          MinLengthValidator(4,
                              errorText:
                                  "Address must be at least 4 digits long"),
                        ],
                      ),
                      labelText: "ADDRESS",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      readOnly: true,
                      onTap: onProvinceTap,
                      textController: txtProvinceController,
                      textInputType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          // RequiredValidator(errorText: "Prov is required"),
                          // MinLengthValidator(4,
                          // errorText: "Name must be at least 4 digits long"),
                        ],
                      ),
                      labelText: "PROVINCE",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      readOnly: true,
                      textController: TextEditingController(text: '8500000'),
                      textInputType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "Province is required"),
                          // MinLengthValidator(4,
                          // errorText: "Name must be at least 4 digits long"),
                        ],
                      ),
                      labelText: "ZIP CODE",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: txtPhoneController,
                      textInputType: TextInputType.phone,
                      // readOnly: true,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                              errorText: "Phone number is required"),
                          PatternValidator(r'^\+?0[0-9]{9}$',
                              errorText: "Phone number not correct"),
                        ],
                      ),
                      labelText: "PHONE NUMBER",
                    ),
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      readOnly: true,
                      textController: TextEditingController(text: 'Vietnam'),
                      textInputType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          // RequiredValidator(errorText: "Name is required"),
                          // MinLengthValidator(4,
                          //     errorText: "Name must be at least 4 digits long"),
                        ],
                      ),
                      labelText: "COUNTRY",
                    ),
                  ],
                ),
              ),
              MyTextButton(
                function: () {},
                content: "SAVE",
                isLoading: false,
              ),
              _isEdit
                  ? DeleteAddressButton(
                      function: () {},
                      content: "DELETE ADDRESS",
                      isLoading: false,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
