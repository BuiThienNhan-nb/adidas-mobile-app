import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/palette.dart';

class MyRadioButton extends StatelessWidget {
  const MyRadioButton({
    Key? key,
    required List<String> values,
    required String selectedValue,
    required Function(String?)? onChanged,
  })  : _values = values,
        _selectedValue = selectedValue,
        _onChanged = onChanged,
        super(key: key);
  final String _selectedValue;
  final List<String> _values;
  final Function(String?)? _onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      height: 70.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _values
            .map(
              (e) => Expanded(
                child: RadioListTile<String>(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  activeColor: AppColors.blackColor,
                  value: e,
                  groupValue: _selectedValue,
                  title: Text(e),
                  onChanged: _onChanged,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
