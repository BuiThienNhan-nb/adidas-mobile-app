import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_adidas_clone/configs/domain.dart';
import 'package:flutter_adidas_clone/configs/end_point/auth_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/banner_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/order_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/product_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/user_end_points.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_adidas_clone/models/order.dart';
import 'package:flutter_adidas_clone/models/product.dart';

import '../configs/domain.dart';
import '../configs/end_point/auth_end_points.dart';
import '../configs/end_point/user_end_points.dart';

class DataRepository {
  static final DataRepository _singelton = DataRepository._internal();

  factory DataRepository() {
    return _singelton;
  }

  DataRepository._internal();

  final baseUrl = Domain.apiUrl;
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    connectTimeout: 60 * 1000, // 60 seconds
    receiveTimeout: 60 * 1000, // 60 seconds
  );
  // register
  Future<Response> register(String email, String passWord) async {
    Dio _dio = Dio(options);

    final data = {"email": email, "password": passWord};
    try {
      Response response = await _dio.post(
        "$baseUrl${AuthEndPoint.register}",
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      return response;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }

  // login
  Future<Response> login(String email, String passWord) async {
    Dio dio = Dio(options);
    final data = {"email": email, "password": passWord};

    Response response = await dio.post(
      "$baseUrl${AuthEndPoint.login}",
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    log(response.statusCode.toString());
    return response;
  }

  Future<Response> checkEmail(String id) async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${AuthEndPoint.checkEmail(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> updateUserInfor(
      String id, String fullName, String dateOfBirth) async {
    Dio dio = Dio(options);
    final data = {"fullName": fullName, "dateOfBirth": dateOfBirth};

    Response response = await dio.patch(
      "$baseUrl${UserEndPoint.updateUserInfor(id)}",
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> getUserById(String id) async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${UserEndPoint.getUserById(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<List<AdBanner>> getBanners() async {
    print('getBanners');

    Dio dio = Dio(options);
    Response response = await dio
        .get(
      "$baseUrl${BannerEndPoint.getAllBanners}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    if (response.statusCode == 200) {
      final List result = response.data;
      // result.map((e) => AdBanner.fromJson(e)).toList();
      // print(result.map((e) => AdBanner.fromMap(e)).toList());
      return result.map((e) => AdBanner.fromMap(e)).toList();
    } else {
      throw Exception('error');
    }

    // print(response.data);
  }

  Future<Response> addToCart(String id) async {
    Dio dio = Dio(options);
    Response response = await dio.post(
      "$baseUrl${UserEndPoint.getUserById(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> likeProduct(
      {required String idProd, required String idUser}) async {
    Dio dio = Dio(options);
    Response response = await dio.patch(
      "$baseUrl${ProductEndPoint.likeProduct(idProd, idUser)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> disLikeProduct(
      {required String idProd, required String idUser}) async {
    Dio dio = Dio(options);
    Response response = await dio.patch(
      "$baseUrl${ProductEndPoint.dislikeProduct(idProd, idUser)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<List<Product>> getListFav({required String id}) async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${UserEndPoint.getListFav(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      final List result = response.data;
      // result.map((e) => AdBanner.fromJson(e)).toList();
      // print(result.map((e) => AdBanner.fromMap(e)).toList());
      return result.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<Response> addToBag(
      {required String idProd, required String idUser}) async {
    Dio dio = Dio(options);
    Response response = await dio.patch(
      "$baseUrl${ProductEndPoint.addToBag(idProd, idUser)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<Response> removeFromBag(
      {required String idProd, required String idUser}) async {
    Dio dio = Dio(options);
    Response response = await dio.patch(
      "$baseUrl${ProductEndPoint.removeFromBag(idProd, idUser)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response;
  }

  Future<List<Product>> getListBag({required String id}) async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${UserEndPoint.getListBag(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      final List result = response.data;
      // result.map((e) => AdBanner.fromJson(e)).toList();
      // print(result.map((e) => AdBanner.fromMap(e)).toList());
      return result.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<List<Product>> getListProduct() async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${ProductEndPoint.getProducts}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      final List result = response.data;
      // result.map((e) => AdBanner.fromJson(e)).toList();
      // print(result.map((e) => AdBanner.fromMap(e)).toList());
      return result.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<void> checkOutOrder({required String id}) async {
    Dio dio = Dio(options);
    await dio.post(
      "$baseUrl${OrderEndPoint.checkOutOrder(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  Future<List<Order>> getOrderByid({required String id}) async {
    Dio dio = Dio(options);
    Response response = await dio.get(
      "$baseUrl${OrderEndPoint.getOrderById(id)}",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200) {
      final List result = response.data;
      // result.map((e) => AdBanner.fromJson(e)).toList();
      // print(result.map((e) => AdBanner.fromMap(e)).toList());
      return result.map((e) => Order.fromMap(e)).toList();
    } else {
      throw Exception('error');
    }
  }
  // Future<List<AdBanner>> getBanners() async {
  //   print('getBanners');

  //   Dio dio = Dio(options);
  //   Response response = await dio.get(
  //     "$baseUrl${BannerEndPoint.getAllBanners}",
  //     options: Options(
  //       followRedirects: false,
  //       validateStatus: (status) {
  //         return status! < 500;
  //       },
  //     ),
  //   );

  //   if (response.statusCode == 200) {
  //     final List result = response.data;
  //     // result.map((e) => AdBanner.fromJson(e)).toList();
  //     // print(result.map((e) => AdBanner.fromMap(e)).toList());
  //     return result.map((e) => AdBanner.fromMap(e)).toList();
  //   } else {
  //     throw Exception('error');
  //   }

  //   // print(response.data);
  // }

  Future<Response> onValue(Response response) async {
    dynamic result;

    final Map<String, dynamic> responseData = json.decode(response.data);

    log(responseData.toString());

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': responseData
      };
    } else {
      result = {
        'status': false,
        'message': 'Successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  onError(error) {
    log('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
