import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/form/widgets/base_text_form_field.dart';
import 'package:flutter_state_example/common/validator.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validationEnabled})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool validationEnabled;

  @override
  Widget build(BuildContext context) {
    debugPrint('EmailTextFormField.build()');

    return BaseTextFormField(
      controller: controller,
      hintText: 'name@domain.com',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      label: label,
      keyboardType: TextInputType.emailAddress,
      validationEnabled: validationEnabled,
      validator: (value) {
        return Validator.isEmail(value);
      },
    );
  }
}
