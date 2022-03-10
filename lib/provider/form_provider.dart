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

  bool _isValidationOn = false;

  void emailChanged(String? email) {
    if (email == _email.value) return;
    _validateEmail(email);
    notifyListeners();
  }

  void _validateEmail(String? email) {
    String? error = (_isValidationOn) ? Validator.isEmail(email) : null;
    _email = ValidationModel(email, error);
  }

  void passwordChanged(String? password) {
    if (password == _password.value) return;
    _validatePassword(password);
    notifyListeners();
  }

  void _validatePassword(String? password) {
    String? error = (_isValidationOn) ? Validator.isPassword(password) : null;
    _password = ValidationModel(password, error);
  }

  void nameChanged(String? name) {
    if (name == _name.value) return;
    _validateName(name);
    notifyListeners();
  }

  void _validateName(String? name) {
    String? error = (_isValidationOn) ? Validator.isName(name) : null;
    _name = ValidationModel(name, error);
  }

  void phoneChanged(String? phone) {
    if (phone == _phone.value) return;
    _validatePhone(phone);
    notifyListeners();
  }

  void _validatePhone(String? phone) {
    String? error = (_isValidationOn) ? Validator.isPhone(phone) : null;
    _phone = ValidationModel(phone, error);
  }

  void validate() {}

  bool get isValid {
    _isValidationOn = true;
    _validateName(_name.value);
    _validateEmail(_email.value);
    _validatePhone(_phone.value);
    _validatePassword(_password.value);

    final bool isValidName = (_name.error == null);
    final bool isValidEmail = (_email.error == null);
    final bool isValidPhone = (_phone.error == null);
    final bool isValidPassword = (_password.error == null);

    bool isValid =
        isValidName && isValidEmail && isValidPhone & isValidPassword;
    if (!isValid) notifyListeners();
    return isValid;
  }
}
