import 'package:form_field_validator/form_field_validator.dart';

class AppValidators {
  static final emailValidator = MultiValidator(
    [
      EmailValidator(errorText: 'Please enter a valid email!'),
      RequiredValidator(errorText: 'Email is required'),
      // WhiteSpaceValidator(errorText: 'Email must not contain whitespace'),
    ],
  );

  static final passwordValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'Password is required'),
      MinLengthValidator(8,
          errorText: 'Password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'Passwords must have at least one special character'),
      WhiteSpaceValidator(errorText: 'Password must not contain whitespace'),
    ],
  );

  static final nameValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'Name is required'),
      MinLengthValidator(4, errorText: 'Name must be at least 4 digits long'),
    ],
  );
}

class WhiteSpaceValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  WhiteSpaceValidator({required String errorText}) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    // return true if the value is valid according the your condition
    return !value!.contains(' ');
  }
}
