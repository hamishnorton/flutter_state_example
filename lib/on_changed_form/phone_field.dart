import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_state_example/common/validator.dart';

import 'base_stateful_text_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key? key,
    this.initialValue = '',
    required this.label,
    required this.onChanged,
    required this.isValidationEnabled,
  }) : super(key: key);

  final String initialValue;
  final String label;
  final Function(String) onChanged;
  final bool isValidationEnabled;

  @override
  Widget build(BuildContext context) {
    // debugPrint('PhoneField.build()');
    // debugPrint('label: $label');
    // debugPrint('validationEnabled: $isValidationEnabled');
    // debugPrint('initialValue: $initialValue');

    return BaseStatefulTextField(
      // _focusNode: FocusNode(),
      //hadFocus: () {},
      hintText: '+64 21 123 456',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d+()-\s]'))
      ],
      label: label,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      isValidationEnabled: isValidationEnabled,
      validator: (value) {
        // debugPrint('PhoneField.BaseTextField.validator(value: $value)');
        return Validator.isPhone(value);
      },
    );
  }
}
