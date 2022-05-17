import 'package:flutter/material.dart';

import '../setting_app_bar.dart';
import 'body_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String id = "PrivacyPolicyScreen";
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: 'PRIVACY POLICY'),
      body: PrivacyTermBodyWidget(mdFileName: "privacy.md"),
    );
  }
}
