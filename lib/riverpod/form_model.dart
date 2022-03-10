import 'package:flutter/material.dart';
import 'package:flutter_state_example/riverpod/validation_model.dart';

@immutable // todo: find out if this is needed as the class is already immutable by design?
class FormModel {
  final ValidationModel name;
  final ValidationModel email;
  final ValidationModel phone;
  final ValidationModel password;
  final bool validationEnabled;

  const FormModel(
      this.name, this.email, this.phone, this.password, this.validationEnabled);

  bool? get isValid {
    if (!validationEnabled) return null;
    return (name.isValid && email.isValid && phone.isValid && password.isValid);
  }

  FormModel.empty()
      : name = ValidationModel.empty(),
        email = ValidationModel.empty(),
        phone = ValidationModel.empty(),
        password = ValidationModel.empty(),
        validationEnabled = false;

  FormModel copyWith(
      {ValidationModel? name,
      ValidationModel? email,
      ValidationModel? phone,
      ValidationModel? password,
      bool? validationEnabled}) {
    return FormModel(
      name ?? this.name,
      email ?? this.email,
      phone ?? this.phone,
      password ?? this.password,
      validationEnabled ?? this.validationEnabled,
    );
  }
}
