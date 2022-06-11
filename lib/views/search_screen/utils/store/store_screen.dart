import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';
import 'package:flutter_adidas_clone/views/search_screen/utils/store/store_item.dart';
import 'package:flutter_adidas_clone/views/utils/mock_data.dart';

import '../../../../models/store.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Store> stores = AppMockData().stores;

    return Scaffold(
      appBar: const SettingAppBar(title: 'STORE FINDER'),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) => StoreItem(store: stores[index]),
      ),
    );
  }
}
