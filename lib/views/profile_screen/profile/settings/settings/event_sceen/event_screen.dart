import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/event_sceen/empty_event_widget.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';

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
