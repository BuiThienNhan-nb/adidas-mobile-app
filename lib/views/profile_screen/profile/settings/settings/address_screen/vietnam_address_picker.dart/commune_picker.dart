import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/commune.dart';
import 'package:flutter_adidas_clone/models/district.dart';
import 'package:flutter_adidas_clone/service/api/vietnam_administrative_division_repo.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/address_screen/vietnam_address_picker.dart/picker_item.dart';
import 'package:flutter_adidas_clone/views/profile_screen/profile/settings/settings/setting_app_bar.dart';

import '../../../../../../utils/widget/loading_indicator.dart';

class CommunePicker extends StatelessWidget {
  const CommunePicker({
    Key? key,
    required this.title,
    required this.district,
    required this.currentAddress,
    required this.callbackAddress,
  }) : super(key: key);

  final String title;
  final District district;
  final String currentAddress;
  final Function(String address) callbackAddress;

  @override
  Widget build(BuildContext context) {
    late Future<List<Commune>> communes = VietNamAdministrativeDivisionRepo()
        .fetchAllCommunesByDistrict(district.idDistrict);

    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: FutureBuilder<List<Commune>>(
        future: communes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => addressPickerItem(
                (value) {
                  log('${index.toString()} - $value');

                  callbackAddress('$currentAddress - $value');
                  Navigator.of(context).pop();
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
          return Center(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }
}
