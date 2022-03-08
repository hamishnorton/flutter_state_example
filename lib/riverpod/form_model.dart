import 'package:flutter/material.dart';
import 'package:flutter_state_example/riverpod/validation_model.dart';

@immutable // todo: find out if this is needed as the class is already immutable by design?
class FormModel {
  final ValidationModel name;
  final ValidationModel email;
  final ValidationModel phone;
  final ValidationModel password;

  const FormModel(this.name, this.email, this.phone, this.password);

  get isValid =>
      (name.isValid && email.isValid && phone.isValid && password.isValid);

  FormModel.empty()
      : name = ValidationModel.empty(),
        email = ValidationModel.empty(),
        phone = ValidationModel.empty(),
        password = ValidationModel.empty();

  FormModel copyWith(
      {ValidationModel? name,
      ValidationModel? email,
      ValidationModel? phone,
      ValidationModel? password}) {
    return FormModel(
      name ?? this.name,
      email ?? this.email,
      phone ?? this.phone,
      password ?? this.password,
    );
  }
}
