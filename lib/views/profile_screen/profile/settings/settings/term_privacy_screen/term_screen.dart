import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/term_privacy_screen/body_widget.dart';

class TermsConditionScreen extends StatelessWidget {
  static const String id = "TermsConditionScreen";
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: 'TERMS AND CONDITIONS'),
      body: PrivacyTermBodyWidget(mdFileName: "term.md"),
    );
  }
}
