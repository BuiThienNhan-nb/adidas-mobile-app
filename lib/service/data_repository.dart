import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_adidas_clone/configs/domain.dart';
import 'package:flutter_adidas_clone/configs/end_point/auth_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/banner_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/user_end_points.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';

class DataRepository {
  static final DataRepository _singelton = DataRepository._internal();

  factory DataRepository() {
    return _singelton;
  }

  DataRepository._internal();

  final baseUrl = Domain.apiUrl;
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    connectTimeout: 10 * 1000, // 60 seconds
    receiveTimeout: 10 * 1000, // 60 seconds
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
    print(response.statusCode);
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
    Response response = await dio.get(
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
      throw Exception('eror');
    }

    // print(response.data);
  }

  Future<Response> onValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.data);

    print(responseData);

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
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
