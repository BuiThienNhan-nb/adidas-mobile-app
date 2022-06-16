import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/search_screen/screens/search_screen.dart';
import 'package:flutter_adidas_clone/views/search_screen/search_screen_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../configs/palette.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.isNext,
    required this.onSearchTap,
  }) : super(key: key);

  final bool isNext;
  final Function() onSearchTap;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
        controller: context.read<SearchScreenProvider>().txtController,
        readOnly: widget.isNext,
        onTap: () {
          if (widget.isNext) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SearchScreen(),
              ),
            );
          } else {}
        },
        onChanged: (value) {
          log(context.read<SearchScreenProvider>().txtController.text);
          log(value);
          // if (!(value == '')) {
          //   setState(() => suffixIcon = suffixIconTemplate);
          if ((value != '')) {
            context.read<SearchScreenProvider>().txtController.text = value;
            context.read<SearchScreenProvider>().txtController.selection =
                TextSelection.fromPosition(TextPosition(
                    offset: context
                        .read<SearchScreenProvider>()
                        .txtController
                        .text
                        .length));
            setState(() => suffixIcon = suffixIconTemplate);
          } else {
            setState(() => suffixIcon = null);
          }
        },
        onFieldSubmitted: (String? value) {
          context.read<SearchScreenProvider>().updateText(value ?? '');
          // context.read<SearchScreenProvider>().onSubmitSearch();
          widget.onSearchTap();
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
                    onTap: () {
                      context.read<SearchScreenProvider>().updateText('');
                      context.read<SearchScreenProvider>().isSearching = true;
                      context.read<SearchScreenProvider>().currentPage = 0;
                      Navigator.of(context).pop();
                    },
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
                    context.read<SearchScreenProvider>().txtController.text =
                        '';
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
