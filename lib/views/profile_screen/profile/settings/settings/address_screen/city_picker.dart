import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';


class CityPicker extends StatefulWidget {
  const CityPicker({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function(String value) callback;

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country->State->City'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CountryStateCityPicker(
                country: country,
                
                state: state,
                city: city,
                textFieldInputBorder: const UnderlineInputBorder(),
              ),
              const SizedBox(height: 20),
              Text("${country.text}, ${state.text}, ${city.text}")
            ],
          )),
    );
  }

  // final String country = 'Vietnam';
  // String stateValue = 'Ho Chi Minh City';
  // String cityValue = '';
  // String address = '';

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: const SettingAppBar(title: 'PROVINCE PICKER'),
  //     body: Center(
  //       child: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 20.w),
  //         height: 600,
  //         child: Column(
  //           children: [
  //             CSCPicker(
  //               defaultCountry: DefaultCountry.Vietnam,
  //               currentCountry: country,

  //               ///Disable country dropdown (Note: use it with default country)
  //               disableCountry: true,

  //               currentState: stateValue,
  //               currentCity: cityValue,

  //               // ///Enable disable state dropdown [OPTIONAL PARAMETER]
  //               // showStates: true,

  //               // /// Enable disable city drop down [OPTIONAL PARAMETER]
  //               // showCities: true,

  //               ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
  //               flagState: CountryFlag.DISABLE,

  //               ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
  //               dropdownDecoration: BoxDecoration(
  //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
  //                   color: Colors.white,
  //                   border: Border.all(color: Colors.grey.shade300, width: 1)),

  //               ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
  //               disabledDropdownDecoration: BoxDecoration(
  //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
  //                   color: Colors.grey.shade300,
  //                   border: Border.all(color: Colors.grey.shade300, width: 1)),

  //               ///placeholders for dropdown search field
  //               countrySearchPlaceholder: "Country",
  //               stateSearchPlaceholder: "State",
  //               citySearchPlaceholder: "City",

  //               ///labels for dropdown
  //               countryDropdownLabel: "*Country",
  //               stateDropdownLabel: "*State",
  //               cityDropdownLabel: "*City",

  //               ///selected item style [OPTIONAL PARAMETER]
  //               selectedItemStyle: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 14,
  //               ),

  //               ///DropdownDialog Heading style [OPTIONAL PARAMETER]
  //               dropdownHeadingStyle: const TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.bold),

  //               ///DropdownDialog Item style [OPTIONAL PARAMETER]
  //               dropdownItemStyle: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 14,
  //               ),

  //               ///Dialog box radius [OPTIONAL PARAMETER]
  //               dropdownDialogRadius: 10.0,

  //               ///Search bar radius [OPTIONAL PARAMETER]
  //               searchBarRadius: 10.0,

  //               ///triggers once country selected in dropdown
  //               // onCountryChanged: (value) {
  //               //   // setState(() {
  //               //   //   ///store value in country variable
  //               //   //   countryValue = value;
  //               //   // });
  //               // },

  //               ///triggers once state selected in dropdown
  //               onStateChanged: (value) {
  //                 setState(() {
  //                   ///store value in state variable
  //                   stateValue = value!;
  //                 });
  //               },

  //               ///triggers once city selected in dropdown
  //               onCityChanged: (value) {
  //                 setState(() {
  //                   ///store value in city variable
  //                   cityValue = value!;
  //                 });
  //               },
  //             ),

  //             ///print newly selected country state and city in Text Widget
  //             MyTextButton(
  //               function: () => widget.callback('$cityValue, $stateValue'),
  //               content: 'CONFIRM',
  //               isLoading: false,
  //               icon: Image.asset(
  //                 'assets/icons/check_icon.png',
  //                 color: AppColors.whiteColor,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //}
}
