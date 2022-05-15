import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_adidas_clone/configs/domain.dart';
import 'package:flutter_adidas_clone/configs/end_point/auth_end_points.dart';
import 'package:flutter_adidas_clone/configs/end_point/user_end_points.dart';

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
  }

  // login
  Future<Response> login(String email, String passWord) async {
    Dio dio = Dio();
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
    Dio dio = Dio();
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
    Dio dio = Dio();
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
    Dio dio = Dio();
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
