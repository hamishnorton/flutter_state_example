import 'package:flutter/widgets.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/common/validator.dart';

class FormProvider extends ChangeNotifier {
  TextFieldModel _email = TextFieldModel.empty();
  TextFieldModel _password = TextFieldModel.empty();
  TextFieldModel _phone = TextFieldModel.empty();
  TextFieldModel _name = TextFieldModel.empty();
  TextFieldModel get email => _email;
  TextFieldModel get password => _password;
  TextFieldModel get phone => _phone;
  TextFieldModel get name => _name;

  bool _isValidationOn = false;

  void emailChanged(String? email) {
    if (email == _email.value) return;
    _validateEmail(email);
    notifyListeners();
  }

  void _validateEmail(String? email) {
    String? error = (_isValidationOn) ? Validator.isEmail(email) : null;
    _email = TextFieldModel(email, error);
  }

  void passwordChanged(String? password) {
    if (password == _password.value) return;
    _validatePassword(password);
    notifyListeners();
  }

  void _validatePassword(String? password) {
    String? error = (_isValidationOn) ? Validator.isPassword(password) : null;
    _password = TextFieldModel(password, error);
  }

  void nameChanged(String? name) {
    if (name == _name.value) return;
    _validateName(name);
    notifyListeners();
  }

  void _validateName(String? name) {
    String? error = (_isValidationOn) ? Validator.isName(name) : null;
    _name = TextFieldModel(name, error);
  }

  void phoneChanged(String? phone) {
    if (phone == _phone.value) return;
    _validatePhone(phone);
    notifyListeners();
  }

  void _validatePhone(String? phone) {
    String? error = (_isValidationOn) ? Validator.isPhone(phone) : null;
    _phone = TextFieldModel(phone, error);
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
