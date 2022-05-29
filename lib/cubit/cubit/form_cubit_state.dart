part of 'form_cubit.dart';

@immutable
abstract class FormCubitState {
  final TextFieldModel name;
  final TextFieldModel email;
  final TextFieldModel phone;
  final TextFieldModel password;
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
      : super(TextFieldModel(null, null), TextFieldModel(null, null),
            TextFieldModel(null, null), TextFieldModel(null, null), false);
}

class Changed extends FormCubitState {
  const Changed(TextFieldModel name, TextFieldModel email, TextFieldModel phone,
      TextFieldModel password, bool validationEnabled)
      : super(name, email, phone, password, validationEnabled);
}
