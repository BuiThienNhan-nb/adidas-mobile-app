import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

// ignore: must_be_immutable
class PasswordFieldInput extends StatefulWidget {
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
  bool obcureText = true;
  Function()? onSuffixIconTap;
  String? Function(String?)? validator;

  PasswordFieldInput({
    Key? key,
    this.lableText,
    this.obcureText = true,
    this.readOnly = false,
    this.bgColor = Colors.transparent,
    // ignore: non_constant_identifier_names
    this.TextColor = AppColors.iconBackgroundColor,
    this.onTap,
    this.onSuffixIconTap,
    required this.onTextSubmitted,
    required this.textController,
    required this.textinputType,
    required this.validator,
  }) : super(key: key);

  @override
  State<PasswordFieldInput> createState() => _PasswordFieldInputState();
}

class _PasswordFieldInputState extends State<PasswordFieldInput> {
  void togglePasswordVisibity() =>
      setState(() => widget.obcureText = !widget.obcureText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      height: 70.h,
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          obscureText: widget.obcureText,
          onTap: widget.onTap,
          keyboardType: widget.textinputType,
          validator: widget.validator,
          onFieldSubmitted: (value) {
            widget.onTextSubmitted(value);
          },
          controller: widget.textController,
          readOnly: widget.readOnly,
          cursorColor: AppColors.iconBackgroundColor,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.iconBackgroundColor),
                borderRadius: BorderRadius.circular(0.r)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.r),
            ),
            labelText: widget.lableText,
            labelStyle:
                TextStyle(color: widget.TextColor, fontWeight: FontWeight.bold),
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12.0, bottom: 4.0),
              child: IconButton(
                onPressed: togglePasswordVisibity,
                icon: widget.obcureText
                    ? Image.asset(
                        'assets/icons/eye_icon.png',
                        height: 28.h,
                        width: 28.w,
                      )
                    : Image.asset(
                        'assets/icons/eye_crossed_icon.png',
                        height: 28.h,
                        width: 28.w,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
