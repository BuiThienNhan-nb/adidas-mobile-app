import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/district.dart';
import 'package:flutter_adidas_clone/models/province.dart';
import 'package:flutter_adidas_clone/service/api/vietnam_administrative_division_repo.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/commune_picker.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/picker_item.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';

class DistrictPicker extends StatelessWidget {
  const DistrictPicker({
    Key? key,
    required this.title,
    required this.province,
    required this.callbackAddress,
  }) : super(key: key);

  final String title;
  final Province province;
  final Function(String address) callbackAddress;

  @override
  Widget build(BuildContext context) {
    late Future<List<District>> districts = VietNamAdministrativeDivisionRepo()
        .fetchAllDistrictsByProvince(province.idProvince);

    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: FutureBuilder<List<District>>(
        future: districts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => addressPickerItem(
                (value) {
                  log('${index.toString()} - $value');
                  Navigator.of(context)
                    ..pop()
                    ..push(
                      CupertinoPageRoute(
                        builder: (context) => CommunePicker(
                          title: 'COMMUNE PICKER',
                          district: snapshot.data![index],
                          currentAddress:
                              '${province.name} - ${snapshot.data![index].name}',
                          callbackAddress: (province) =>
                              callbackAddress('$province - $value'),
                        ),
                      ),
                    );
                },
                snapshot.data![index].name,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }

          // Default
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
