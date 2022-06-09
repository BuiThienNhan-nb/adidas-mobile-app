import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_adidas_clone/service/data_repository.dart';

class BannerProvider extends ChangeNotifier {
  // Future<List<AdBanner>> getBanners() async {
  //   print('bannerProvider');

  //   Response response = await DataRepository().getBanners();

  //   // final List result = await jsonDecode(response.data);
  //   // print('bannerProvider');

  //   if (response.statusCode == 200) {
  //     notifyListeners();
  //     print(response.data);
  //     return response.data;
  //   } else {
  //     notifyListeners();
  //     return response.data;
  //   }
  // }
}
