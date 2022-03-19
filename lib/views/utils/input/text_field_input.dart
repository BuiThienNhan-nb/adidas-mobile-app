import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFieldInput extends StatelessWidget {
  final TextEditingController textController;
  bool readOnly = false;
  // ignore: prefer_typing_uninitialized_variables
  var lableText;
  Color bgColor = Colors.transparent;
  // ignore: non_constant_identifier_names
  Color TextColor = AppColor.kIconBackgroundColor;
  final Function(String) onTextChanged;
  Function()? onTap;
  final TextInputType textinputType;
  bool obcureText = false;
  String? Function(String?)? validator;

  TextFieldInput({
    Key? key,
    this.lableText,
    this.obcureText = false,
    this.readOnly = false,
    this.bgColor = Colors.transparent,
    // ignore: non_constant_identifier_names
    this.TextColor = AppColor.kIconBackgroundColor,
    this.onTap,
    required this.onTextChanged,
    required this.textController,
    required this.textinputType,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          obscureText: obcureText,
          onTap: onTap,
          keyboardType: textinputType,
          validator: validator,
          onChanged: (value) {
            onTextChanged(value);
          },
          controller: textController,
          readOnly: readOnly,
          cursorColor: AppColor.kIconBackgroundColor,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.kIconBackgroundColor),
                borderRadius: BorderRadius.circular(0.r)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.r),
            ),
            labelText: lableText,
            labelStyle: TextStyle(color: TextColor),
          ),
        ),
      ),
    );
  }
}
