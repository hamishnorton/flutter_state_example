import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/validation_model.dart';
import 'package:flutter_state_example/validator.dart';

part 'form_cubit_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(FormInitial());

  bool _isValidationOn = false;
  // TODO: could I be using the state instead?

  // TODO: question: what would happen if we didn't allow null?
  // TODO: Add .copyWith

  void nameChanged(String? name) {
    if (name == state.name.value) return; // 'Might' prevent a rebuild
    _validateName(name);
  }

  void _validateName(String? name) {
    final String? error = (_isValidationOn) ? Validator.isName(name) : null;
    final newVm = ValidationModel(name, error);
    emit(Changed(
        newVm, state.email, state.phone, state.password, _isValidationOn));
  }

  void emailChanged(String? email) {
    if (email == state.email.value) return;
    _validateEmail(email);
  }

  void _validateEmail(String? email) {
    final String? error = (_isValidationOn) ? Validator.isEmail(email) : null;
    final newVm = ValidationModel(email, error);
    emit(Changed(
        state.name, newVm, state.phone, state.password, _isValidationOn));
  }

  void phoneChanged(String? phone) {
    if (phone == state.phone.value) return;
    _validatePhone(phone);
  }

  void _validatePhone(String? phone) {
    final String? error = (_isValidationOn) ? Validator.isPhone(phone) : null;
    final newVm = ValidationModel(phone, error);
    emit(Changed(
        state.name, state.email, newVm, state.password, _isValidationOn));
  }

  void passwordChanged(String? password) {
    if (password == state.password.value) return;
    _validatePassword(password);
  }

  void _validatePassword(String? password) {
    final String? error =
        (_isValidationOn) ? Validator.isPassword(password) : null;
    final newVm = ValidationModel(password, error);
    emit(Changed(state.name, state.email, state.phone, newVm, _isValidationOn));
  }

  void validated() {
    _isValidationOn = true;
    _validateName(state.name.value);
    _validateEmail(state.email.value);
    _validatePhone(state.phone.value);
    _validatePassword(state.password.value);
  }
}
