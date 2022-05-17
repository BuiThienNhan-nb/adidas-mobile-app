import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../../../../../configs/format.dart';
import '../../../../../../configs/palette.dart';
import '../../../../../../configs/validator.dart';
import '../../../../../../view_models/auth_view_model/auth_provider.dart';
import '../../../../../../view_models/auth_view_model/user_provider.dart';
import '../../../../../utils/button/my_radio_button.dart';
import '../../../../../utils/button/my_text_button.dart';
import '../../../../../utils/input/text_field_input.dart';
import '../setting_app_bar.dart';
import 'forgot_password.dart';

class PersonalScreen extends StatefulWidget {
  static const String id = "PersonalScreen";
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController txtNameController =
        TextEditingController(text: context.read<UserProvider>().user.fullName);
    final TextEditingController txtBirthdateController = TextEditingController(
      text: AppFormat.formatDay
          .format(context.read<UserProvider>().user.dateOfBirth),
    );
    final String email = context.read<UserProvider>().user.email;
    String txtGender = context.read<UserProvider>().user.gender ?? "";
    final key = GlobalKey<FormState>();
    final initDate = txtBirthdateController.text == ""
        ? DateTime(2001, 9, 25)
        : AppFormat.formatDay.parse(txtBirthdateController.text);

    void pickDate() async {
      final pickDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary:
                    AppColors.iconBackgroundColor, // header background color
                onPrimary: AppColors.backgroundColor, // header text color
                onSurface: AppColors.iconBackgroundColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.iconBackgroundColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickDate == null) return;
      txtBirthdateController.text = AppFormat.formatDay.format(pickDate);
    }

    return Scaffold(
      appBar: const SettingAppBar(title: "EDIT PERSONAL INFO"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: key,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldInput(
                  onTextSubmitted: (str) {},
                  textController: txtNameController,
                  textinputType: TextInputType.emailAddress,
                  validator: AppValidators.nameValidator,
                  lableText: "NAME",
                ),
                TextFieldInput(
                  onTextSubmitted: (str) {},
                  textController: txtBirthdateController,
                  textinputType: TextInputType.emailAddress,
                  validator:
                      RequiredValidator(errorText: "Birthdate is required"),
                  onTap: () => pickDate(),
                  lableText: "BIRTHDATE",
                  readOnly: true,
                ),
                TextFieldInput(
                  onTextSubmitted: (str) {},
                  textController: TextEditingController(text: email),
                  textinputType: TextInputType.emailAddress,
                  validator: AppValidators.emailValidator,
                  lableText: "EMAIL",
                  readOnly: true,
                  suffixIcon: const Icon(Icons.lock,
                      color: AppColors.iconBackgroundColor),
                ),
                TextFieldInput(
                  onTextSubmitted: (str) {},
                  textController: TextEditingController(text: "12345678@"),
                  textinputType: TextInputType.emailAddress,
                  validator: (str) {
                    return null;
                  },
                  lableText: "PASSWORD",
                  obcureText: true,
                  suffixIcon: const FaIcon(
                    FontAwesomeIcons.pen,
                    color: AppColors.iconBackgroundColor,
                  ),
                  // ignore: avoid_print
                  onSuffixIconTap: () =>
                      Navigator.pushNamed(context, ForgotPasswordScreen.id),
                  readOnly: true,
                ),
                Stack(
                  children: [
                    TextFieldInput(
                      onTextSubmitted: (str) {},
                      textController: TextEditingController(text: " "),
                      textinputType: TextInputType.emailAddress,
                      validator: (str) {
                        return null;
                      },
                      lableText: "GENDER",
                      readOnly: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MyRadioButton(
                        values: const <String>["Male", "Female", "Other"],
                        selectedValue: txtGender,
                        onChanged: (val) => setState(() => txtGender = val!),
                      ),
                    ),
                  ],
                ),
                MyTextButton(
                  function: () {
                    if (key.currentState!.validate()) {
                      log(txtGender);
                    } else {
                      log('VALIDATE RETURN FALSE');
                    }
                  },
                  content: "SAVE",
                  isLoading: context.read<AuthProvider>().isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
