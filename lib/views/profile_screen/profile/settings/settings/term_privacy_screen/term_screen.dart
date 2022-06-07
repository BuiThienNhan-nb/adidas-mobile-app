import 'package:flutter/material.dart';

import '../setting_app_bar.dart';
import 'body_widget.dart';

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
