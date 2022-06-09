import 'dart:convert';

import 'package:flutter_adidas_clone/models/commune.dart';
import 'package:flutter_adidas_clone/models/district.dart';
import 'package:flutter_adidas_clone/models/province.dart';
import 'package:http/http.dart' as http;

class VietNamAdministrativeDivisionRepo {
  static final VietNamAdministrativeDivisionRepo _singelton =
      VietNamAdministrativeDivisionRepo._internal();

  factory VietNamAdministrativeDivisionRepo() {
    return _singelton;
  }

  VietNamAdministrativeDivisionRepo._internal();

  final baseUrl = 'https://sheltered-anchorage-60344.herokuapp.com';

  Future<List<Province>> fetchAllProvinces() async {
    final response = await http.get(Uri.parse('$baseUrl/province/'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((map) => Province.fromMap(map))
          .toList();
    } else {
      throw Exception('Failed to load Provinces');
    }
  }

  Future<List<District>> fetchAllDistrictsByProvince(String provinceId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/district/?idProvince=$provinceId'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((map) => District.fromMap(map))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Commune>> fetchAllCommunesByDistrict(String districtId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/commune/?idDistrict=$districtId'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((map) => Commune.fromMap(map))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
