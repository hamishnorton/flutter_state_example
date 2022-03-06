part of 'form_cubit.dart';

@immutable
abstract class CubitFormState {
  final ValidationModel name;
  final ValidationModel email;
  final ValidationModel phone;
  final ValidationModel password;

  const CubitFormState(this.name, this.email, this.phone, this.password);

  get isValid =>
      (name.isValid && email.isValid && phone.isValid && password.isValid);
}

class FormInitial extends CubitFormState {
  FormInitial()
      : super(ValidationModel(null, null), ValidationModel(null, null),
            ValidationModel(null, null), ValidationModel(null, null));
}

class Changed extends CubitFormState {
  const Changed(ValidationModel name, ValidationModel email,
      ValidationModel phone, ValidationModel password)
      : super(name, email, phone, password);
}
