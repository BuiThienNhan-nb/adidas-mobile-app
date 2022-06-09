import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/province.dart';
import 'package:flutter_adidas_clone/service/api/vietnam_administrative_division_repo.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/district_picker.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/picker_item.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';

class ProvincePicker extends StatelessWidget {
  const ProvincePicker({
    Key? key,
    required this.title,
    required this.callbackAddress,
  }) : super(key: key);

  final String title;
  final Function(String address) callbackAddress;

  @override
  Widget build(BuildContext context) {
    late Future<List<Province>> provinces =
        VietNamAdministrativeDivisionRepo().fetchAllProvinces();

    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: FutureBuilder<List<Province>>(
        future: provinces,
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
                        builder: (context) => DistrictPicker(
                          title: 'DISTRICT PICKER',
                          province: snapshot.data![index],
                          callbackAddress: callbackAddress,
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
