import 'package:bloc/bloc.dart';
import 'package:flutter_state_example/cubit/validation_model.dart';
import 'package:flutter_state_example/validator.dart';
import 'package:meta/meta.dart';

part 'cubit_form_state.dart';

class FormCubit extends Cubit<CubitFormState> {
  FormCubit() : super(FormInitial());

  // TODO: question: what would happen if we didn't allow null?
  void nameValidated(String? name) {
    if (name == state.name.value) return; // 'Might' prevent a rebuild
    final newVm = ValidationModel(name, Validator.isName(name));
    emit(Changed(newVm, state.email, state.phone, state.password));
  }

  void emailValidated(String? email) {
    if (email == state.email.value) return;
    final newVm = ValidationModel(email, Validator.isEmail(email));
    emit(Changed(state.name, newVm, state.phone, state.password));
  }

  void phoneValidated(String? phone) {
    if (phone == state.phone.value) return;
    final newVm = ValidationModel(phone, Validator.isPhone(phone));
    emit(Changed(state.name, state.email, newVm, state.password));
  }

  void passwordValidated(String? password) {
    if (password == state.password.value) return;
    final newVm = ValidationModel(password, Validator.isPassword(password));
    emit(Changed(state.name, state.email, state.phone, newVm));
  }
}
