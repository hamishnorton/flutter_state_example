import 'package:flutter/widgets.dart';
import 'package:flutter_state_example/provider/validation_model.dart';
import 'package:flutter_state_example/validator.dart';

class FormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  ValidationModel _name = ValidationModel(null, null);
  ValidationModel get email => _email;
  ValidationModel get password => _password;
  ValidationModel get phone => _phone;
  ValidationModel get name => _name;

  void validateEmail(String? val) {
    _email = ValidationModel(val, Validator.isEmail(val));
    notifyListeners();
  }

  void validatePassword(String? val) {
    _password = ValidationModel(val, Validator.isPassword(val));
    notifyListeners();
  }

  void validateName(String? val) {
    _name = ValidationModel(val, Validator.isName(val));
    notifyListeners();
  }

  void validatePhone(String? val) {
    _phone = ValidationModel(val, Validator.isPhone(val));
    notifyListeners();
  }

  bool get validate {
    final bool isValidName = (_name.error == null && _name.value != null);
    final bool isValidEmail = (_email.error == null && _email.value != null);
    final bool isValidPhone = (_phone.error == null && _phone.value != null);
    final bool isValidPassword =
        (_password.error == null && _password.value != null);
    return isValidName && isValidEmail && isValidPhone & isValidPassword;
  }
}
