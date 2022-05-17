import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

// ignore: must_be_immutable
class TextFieldInput extends StatelessWidget {
  final TextEditingController textController;
  bool readOnly = false;
  // ignore: prefer_typing_uninitialized_variables
  var lableText;
  Color bgColor = Colors.transparent;
  // ignore: non_constant_identifier_names
  Color TextColor = AppColors.iconBackgroundColor;
  final Function(String) onTextSubmitted;
  Function()? onTap;
  final TextInputType textinputType;
  Widget suffixIcon = const Icon(null);
  bool obcureText = false;
  Function()? onSuffixIconTap;
  String? Function(String?)? validator;

  TextFieldInput({
    Key? key,
    this.lableText,
    this.obcureText = false,
    this.readOnly = false,
    this.bgColor = Colors.transparent,
    // ignore: non_constant_identifier_names
    this.TextColor = AppColors.iconBackgroundColor,
    this.onTap,
    this.onSuffixIconTap,
    this.suffixIcon = const Icon(null),
    required this.onTextSubmitted,
    required this.textController,
    required this.textinputType,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      height: 70.h,
      child: TextFormField(
        obscureText: obcureText,
        onTap: onTap,
        keyboardType: textinputType,
        validator: validator,
        onFieldSubmitted: (value) {
          onTextSubmitted(value);
        },
        controller: textController,
        readOnly: readOnly,
        cursorColor: AppColors.iconBackgroundColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.iconBackgroundColor),
            borderRadius: BorderRadius.circular(0.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.r),
          ),
          labelText: lableText,
          labelStyle: TextStyle(color: TextColor, fontWeight: FontWeight.bold),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0, bottom: 4.0),
            child: IconButton(
              onPressed: onSuffixIconTap,
              icon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
