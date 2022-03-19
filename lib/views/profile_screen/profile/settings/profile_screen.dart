import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_adidas_clone/configs/size.dart';
import 'package:flutter_adidas_clone/configs/style.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/orders/orders_screen.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "BÙI THIỆN NHÂN",
          style: AppStyle.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.close,
              size: AppSize.navBarIconSize + 12,
              color: AppColor.kIconBackgroundColor,
            ),
          ),
        ],
        bottom: TabBar(
          labelColor: AppColor.kIconBackgroundColor,
          indicatorColor: AppColor.kIconBackgroundColor,
          indicatorWeight: 1.3,
          controller: _tabController,
          tabs: const [
            Tab(text: "ORDERS"),
            Tab(text: "SETTINGS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OrderScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
