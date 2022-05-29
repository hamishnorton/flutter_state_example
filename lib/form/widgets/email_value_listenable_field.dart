import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/form/widgets/base_text_value_listenable_field.dart';
import 'package:flutter_state_example/common/validator.dart';

class EmailValueListenableField extends StatelessWidget {
  const EmailValueListenableField(
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
    debugPrint('EmailValueListenableField.build()');

    return BaseTextValueListenableField(
      controller: controller,
      hintText: 'name@domain.com',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      label: label,
      keyboardType: TextInputType.emailAddress,
      validationEnabled: validationEnabled,
      validator: (value) {
        // Thought: If this is the only usage of the validator consider adding it to this Widget as a static method so it can be unit tested.
        return Validator.isEmail(value);
      },
    );
  }
}
