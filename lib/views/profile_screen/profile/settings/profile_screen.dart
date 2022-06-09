import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/palette.dart';
import '../../../../configs/size.dart';
import '../../../../configs/style.dart';
import '../../../../view_models/auth_view_model/user_provider.dart';
import '../orders/orders_screen.dart';
import 'settings/setting_screen.dart';

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
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        shadowColor: Colors.transparent,
        elevation: 0.8,
        automaticallyImplyLeading: false,
        title: Text(
          context.read<UserProvider>().user.fullName,
          style: AppStyles.titleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.close,
              size: AppSizes.navBarIconSize + 12,
              color: AppColors.blackColor,
            ),
          ),
        ],
        bottom: TabBar(
          labelColor: AppColors.blackColor,
          indicatorColor: AppColors.blackColor,
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
