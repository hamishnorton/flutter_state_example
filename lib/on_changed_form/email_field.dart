import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/validator.dart';

import 'base_stateful_text_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
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
    // debugPrint('EmailField.build()');
    // debugPrint('label: $label');
    // debugPrint('validationEnabled: $isValidationEnabled');
    // debugPrint('initialValue: $initialValue');

    return BaseStatefulTextField(
      //stateKey: stateKey,
      //_focusNode: FocusNode(),
      //hadFocus: () {},
      hintText: 'name@domain.com',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      keyboardType: TextInputType.emailAddress,
      label: label,
      onChanged: (value) {
        // debugPrint('EmailField.onchanged(value: $value)');
        onChanged(value);
      },
      isValidationEnabled: isValidationEnabled,
      validator: (value) {
        // debugPrint('EmailField.BaseTextField.validator(value: $value)');
        return Validator.isEmail(value);
      },
    );
  }
}
