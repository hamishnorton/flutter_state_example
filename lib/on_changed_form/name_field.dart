import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/validator.dart';

import 'base_stateful_text_field.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    this.initialValue = '',
    required this.label,
    required this.onChanged,
    required this.isValidationEnabled,
    this.stateKey,
  }) : super(key: key);

  final Key? stateKey;
  final String initialValue;
  final String label;
  final Function(String) onChanged;
  final bool isValidationEnabled;

  @override
  Widget build(BuildContext context) {
    debugPrint('NameField.build()');
    debugPrint('label: $label');
    debugPrint('validationEnabled: $isValidationEnabled');
    debugPrint('initialValue: $initialValue');

    return BaseStatefulTextField(
      hintText: 'firstname surname',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z-' ']'))
      ],
      keyboardType: TextInputType.emailAddress,
      label: label,
      onChanged: (value) {
        debugPrint('NameField.onchanged(value: $value)');
        onChanged(value);
      },
      isValidationEnabled: isValidationEnabled,
      validator: (value) {
        debugPrint('NameField.BaseTextField.validator(value: $value)');
        return Validator.isName(value);
      },
    );
  }
}
