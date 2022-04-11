import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_adidas_clone/views/utils/widget/webview_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpCustomerServiceScreen extends StatelessWidget {
  static const String id = "HelpCustomerServiceScreen";
  const HelpCustomerServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _faqLink = "https://www.adidas-group.com/en/service/faq/";
    return Scaffold(
      appBar: const SettingAppBar(title: "HERE TO HELP"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "STILL CAN'T FIND YOUR ANSWER? ASK OUR CUSTOMER SERVICE",
              style: TextStyle(
                color: AppColors.kIconBackgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20.h),
            HelpServiceItem(
              icon: const FaIcon(
                FontAwesomeIcons.questionCircle,
                color: AppColors.kIconBackgroundColor,
                size: AppSizes.appBarIconSize * 2.5,
              ),
              title: "Vist our help section",
              subTitle: "FAQ & HELP",
              onSubTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Scaffold(
                    appBar: const SettingAppBar(title: "HERE TO HELP"),
                    body: WebViewWidget(
                      webUrl: _faqLink,
                      onBack: () async => true,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Divider(
              color: AppColors.kIconBackgroundColor,
              height: 3.h,
            ),
            SizedBox(height: 20.h),
            HelpServiceItem(
              icon: const FaIcon(
                FontAwesomeIcons.comments,
                color: AppColors.kIconBackgroundColor,
                size: AppSizes.appBarIconSize * 2.5,
              ),
              title:
                  "Facebook. Use the private message option to contact our support team.",
              subTitle: "SEND MESSAGE",
              onSubTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HelpServiceItem extends StatelessWidget {
  const HelpServiceItem({
    required Widget icon,
    required String title,
    required String subTitle,
    required Function() onSubTap,
    Key? key,
  })  : _icon = icon,
        _title = title,
        _subTitle = subTitle,
        _onSubTap = onSubTap,
        super(key: key);

  final Widget _icon;
  final String _title, _subTitle;
  final Function() _onSubTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _icon,
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(child: Text(_title)),
                Text(_title),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: _onSubTap,
                  style: TextButton.styleFrom(
                    // backgroundColor: _isLoading ? AppColors.kButtonOnClick : Colors.black,
                    padding: EdgeInsets.zero,
                    primary: AppColors.kButtonOnClick,
                  ),
                  child: Text(
                    _subTitle,
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                            color: AppColors.kIconBackgroundColor,
                            offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.kIconBackgroundColor,
                      decorationThickness: 3,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
