part of 'form_cubit.dart';

@immutable
abstract class FormCubitState {
  final ValidationModel name;
  final ValidationModel email;
  final ValidationModel phone;
  final ValidationModel password;
  final bool validationEnabled;

  const FormCubitState(
      this.name, this.email, this.phone, this.password, this.validationEnabled);

  bool? get isValid {
    if (!validationEnabled) return null;
    return (name.isValid && email.isValid && phone.isValid && password.isValid);
  }
}

class FormInitial extends FormCubitState {
  FormInitial()
      : super(ValidationModel(null, null), ValidationModel(null, null),
            ValidationModel(null, null), ValidationModel(null, null), false);
}

class Changed extends FormCubitState {
  const Changed(ValidationModel name, ValidationModel email,
      ValidationModel phone, ValidationModel password, bool validationEnabled)
      : super(name, email, phone, password, validationEnabled);
}
