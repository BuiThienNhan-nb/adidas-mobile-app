import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingOption extends StatelessWidget {
  const SettingOption({
    Key? key,
    required String content,
    required Function() function,
  })  : _content = content,
        _function = function,
        super(key: key);
  final String _content;
  final Function() _function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Column(
        children: [
          TextButton(
            onPressed: _function,
            style: TextButton.styleFrom(
              primary: AppColors.buttonOnClick,
            ),
            child: Row(
              children: [
                Text(
                  _content,
                  style: const TextStyle(
                    color: AppColors.iconBackgroundColor,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.iconBackgroundColor,
                )
              ],
            ),
          ),
          Container(
            color: AppColors.greyBackground,
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
