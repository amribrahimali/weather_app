import 'package:form_field_validator/form_field_validator.dart';

class Validation {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be more than 6 charters'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email address is required'),
    EmailValidator(errorText: 'email address is not correct')
  ]);

  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'name is required'),
  ]);
}
