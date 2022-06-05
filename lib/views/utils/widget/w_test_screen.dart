import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<String> names = [
    'Nhan',
    'Bao',
    'Luan',
    'Tuong',
    'Nhi',
    'Uyen',
  ];

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<AnimatedListState>();
    return Scaffold(
      appBar: const SettingAppBar(title: 'TEST SCREEN'),
      body: Padding(
        padding: EdgeInsets.all(16.w),

        // child: ListView.builder(
        //   itemCount: names.length,
        //   itemBuilder: (context, index) =>
        //  Padding(
        //     padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
        //     child: Text(
        //       names[index],
        //       style: AppStyles.boldRegularTextStyle,
        //     ),
        //   ),
        // ),

        child: AnimatedList(
          key: key,
          initialItemCount: names.length,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) => Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            child: Text(
              names[index],
              style: AppStyles.boldRegularTextStyle,
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            names.insert(2, 'Nhan_Test');
            key.currentState!.insertItem(
              2,
              duration: const Duration(milliseconds: 400),
            );
            // names.sort();
          });
          print(names);
        },
        icon: const Icon(Icons.sort),
      ),
    );
  }
}
