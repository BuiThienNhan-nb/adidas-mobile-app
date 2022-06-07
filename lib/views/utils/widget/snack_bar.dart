import 'package:flutter/material.dart';

import '../../../configs/palette.dart';

showSnackBar(BuildContext context, String title, String actionText) {
  SnackBar snackBar = SnackBar(
    duration: const Duration(milliseconds: 400),
    content: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    ),
    action: SnackBarAction(
      label: actionText,
      textColor: AppColors.whiteColor,
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
