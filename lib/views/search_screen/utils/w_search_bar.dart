import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';
import '../screens/search_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.isNext,
  }) : super(key: key);

  final bool isNext;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();
  Widget? suffixIcon;
  final UnderlineInputBorder border = UnderlineInputBorder(
    borderSide: const BorderSide(color: AppColors.silverColor),
    borderRadius: BorderRadius.circular(0.r),
  );
  final Widget suffixIconTemplate = Padding(
    padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
    child: Image.asset(
      'assets/icons/cross_circle_icon.png',
      fit: BoxFit.scaleDown,
      height: 16.h,
      width: 16.w,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: controller,
        readOnly: widget.isNext,
        onTap: () {
          if (widget.isNext) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SearchScreen(),
              ),
            );
          } else {}
        },
        onChanged: (value) {
          log(controller.text);
          log(value);
          // if (!(value == '')) {
          //   setState(() => suffixIcon = suffixIconTemplate);
          if ((value != '')) {
            controller.text = value;
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
            setState(() => suffixIcon = suffixIconTemplate);
          } else {
            setState(() => suffixIcon = null);
          }
        },
        cursorColor: AppColors.blackColor,
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
            child: !widget.isNext
                ? GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.blackColor,
                      size: 18.h,
                    ),
                  )
                : Image.asset(
                    'assets/icons/search_icon_sb.png',
                    fit: BoxFit.scaleDown,
                    height: 4.h,
                    width: 4.w,
                  ),
          ),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: () => setState(() {
                    controller.text = '';
                    suffixIcon = null;
                  }),
                  child: suffixIcon,
                )
              : const SizedBox.shrink(),
          hintText: 'Find products...',
        ),
      ),
    );
  }
}
