import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_adidas_clone/configs/domain.dart';

import 'package:flutter_adidas_clone/configs/end_point.dart';

class DataRepository {
  static final DataRepository _singelton = DataRepository._internal();

  factory DataRepository() {
    return _singelton;
  }

  DataRepository._internal();

  final baseUrl = Domain.apiUrl;

  // register
  Future<Response> register(String email, String passWord) async {
    Dio _dio = Dio();

    final data = {"email": email, "password": passWord};

    Response response =
        await _dio.post("$baseUrl${EndPoint.register}", data: data);
    return response;
  }

  // login
  Future<Response> login(String email, String passWord) async {
    Dio dio = Dio();
    final data = {"email": email, "password": passWord};

    Response response = await dio.post(
      "$baseUrl/${EndPoint.login}",
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
