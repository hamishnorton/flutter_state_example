import 'package:flutter_state_example/riverpod/validation_model.dart';
import 'package:flutter_state_example/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_model.dart';

class FormStateNotifier extends StateNotifier<FormModel> {
  FormStateNotifier() : super(FormModel.empty());

  void nameChanged(String? name) {
    if (name == state.name.value) return;
    // 'Might' prevent a rebuild
    // TODO: Check if RiverPod prevents rebuilds if state is unchanged?
    _validateName(name);
  }

  void _validateName(String? name) {
    final String? error =
        (state.validationEnabled) ? Validator.isName(name) : null;
    final newVm = ValidationModel(name, error);
    state = state.copyWith(name: newVm);
  }

  void emailChanged(String? email) {
    if (email == state.email.value) return;
    _validateEmail(email);
  }

  void _validateEmail(String? email) {
    final String? error =
        (state.validationEnabled) ? Validator.isEmail(email) : null;
    final newVm = ValidationModel(email, error);
    state = state.copyWith(email: newVm);
  }

  void phoneChanged(String? phone) {
    if (phone == state.phone.value) return;
    _validatePhone(phone);
  }

  void _validatePhone(String? phone) {
    final String? error =
        (state.validationEnabled) ? Validator.isPhone(phone) : null;
    final newVm = ValidationModel(phone, error);
    state = state.copyWith(phone: newVm);
  }

  void passwordChanged(String? password) {
    if (password == state.password.value) return;
    _validatePassword(password);
  }

  void _validatePassword(String? password) {
    final String? error =
        (state.validationEnabled) ? Validator.isPassword(password) : null;
    final newVm = ValidationModel(password, error);
    state = state.copyWith(password: newVm);
  }

  void validated() {
    state = state.copyWith(validationEnabled: true);
    _validateName(state.name.value);
    _validateEmail(state.email.value);
    _validatePhone(state.phone.value);
    _validatePassword(state.password.value);
  }
}
