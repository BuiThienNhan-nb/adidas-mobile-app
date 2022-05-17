import 'package:flutter/material.dart';
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
    final TextEditingController _txtNameController =
        TextEditingController(text: "");
    final TextEditingController _txtPhoneController =
        TextEditingController(text: "0");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
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
              color: AppColors.iconBackgroundColor,
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
              TextFieldInput(
                onTextSubmitted: (str) {},
                textController: _txtNameController,
                textinputType: TextInputType.emailAddress,
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: "Name is required"),
                    MinLengthValidator(4,
                        errorText: "Name must be at least 4 digits long"),
                  ],
                ),
                lableText: "NAME",
              ),
              TextFieldInput(
                onTextSubmitted: (str) {},
                textController: _txtPhoneController,
                textinputType: TextInputType.phone,
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: "Phone number is required"),
                    PatternValidator(r'^\+?0[0-9]{9}$',
                        errorText: "Phone number not correct"),
                  ],
                ),
                lableText: "PHONE NUMBER",
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
