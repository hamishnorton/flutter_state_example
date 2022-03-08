import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/riverpod/validation_model.dart';
import 'package:flutter_state_example/validator.dart';

import 'form_model.dart';

class FormStateNotifier extends StateNotifier<FormModel> {
  FormStateNotifier() : super(FormModel.empty());

  void nameValidated(String? name) {
    if (name == state.name.value) return; // 'Might' prevent a rebuild
    final newVm = ValidationModel(name, Validator.isName(name));
    state = state.copyWith(name: newVm);
  }

  void emailValidated(String? email) {
    if (email == state.email.value) return;
    final newVm = ValidationModel(email, Validator.isEmail(email));
    state = state.copyWith(email: newVm);
  }

  void phoneValidated(String? phone) {
    if (phone == state.phone.value) return;
    final newVm = ValidationModel(phone, Validator.isPhone(phone));
    state = state.copyWith(phone: newVm);
  }

  void passwordValidated(String? password) {
    if (password == state.password.value) return;
    final newVm = ValidationModel(password, Validator.isPassword(password));
    state = state.copyWith(password: newVm);
  }
}
