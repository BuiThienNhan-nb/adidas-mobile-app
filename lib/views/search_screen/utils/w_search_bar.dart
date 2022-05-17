import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';
import '../screens/search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.isNext,
  }) : super(key: key);

  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final UnderlineInputBorder border = UnderlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyBackground),
      borderRadius: BorderRadius.circular(0.r),
    );

    return Material(
      child: TextFormField(
        controller: controller,
        readOnly: isNext,
        // autofocus: !isNext,
        onTap: () {
          if (isNext) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SearchScreen(),
              ),
            );
          } else {}
        },
        cursorColor: AppColors.iconBackgroundColor,
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
            child: !isNext
                ? GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.iconBackgroundColor,
                      size: 18.h,
                    ),
                  )
                // ? Image.asset(
                //     'assets/images/arrow_left.png',
                //     fit: BoxFit.scaleDown,
                //     height: 4.h,
                //     width: 4.w,
                //   )
                : Image.asset(
                    'assets/icons/search_icon_sb.png',
                    fit: BoxFit.scaleDown,
                    height: 4.h,
                    width: 4.w,
                  ),
          ),
          hintText: 'Find products...',
        ),
      ),
    );
  }
}
