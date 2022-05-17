import 'package:flutter/material.dart';

import '../setting_app_bar.dart';
import 'empty_event_widget.dart';

class MyEventScreen extends StatelessWidget {
  static const String id = "MyEventScreen";
  const MyEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingAppBar(title: "MY EVENTS"),
      body: EmptyEventWidget(),
    );
  }
}
