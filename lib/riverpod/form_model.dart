import 'package:flutter/material.dart';
import 'package:flutter_state_example/riverpod/text_field_model.dart';

@immutable // todo: find out if this is needed as the class is already immutable by design?
class FormModel {
  final TextFieldModel name;
  final TextFieldModel email;
  final TextFieldModel phone;
  final TextFieldModel password;
  final bool validationEnabled;

  const FormModel(
      this.name, this.email, this.phone, this.password, this.validationEnabled);

  bool? get isValid {
    if (!validationEnabled) return null;
    return (name.isValid && email.isValid && phone.isValid && password.isValid);
  }

  FormModel.empty()
      : name = TextFieldModel.empty(),
        email = TextFieldModel.empty(),
        phone = TextFieldModel.empty(),
        password = TextFieldModel.empty(),
        validationEnabled = false;

  FormModel copyWith(
      {TextFieldModel? name,
      TextFieldModel? email,
      TextFieldModel? phone,
      TextFieldModel? password,
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
