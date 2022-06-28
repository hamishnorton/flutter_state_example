import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/validator.dart';
import 'package:flutter_state_example/on_changed_form/base_stateless_text_field.dart';

class StatelessEmailField extends StatelessWidget {
  const StatelessEmailField({
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
    debugPrint('EmailField.build()');
    debugPrint('label: $label');
    debugPrint('validationEnabled: $isValidationEnabled');
    debugPrint('initialValue: $initialValue');

    return BaseStatelessTextField(
      //return BaseStatefulTextField(
      stateKey: stateKey,
      hintText: 'name@domain.com',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      keyboardType: TextInputType.emailAddress,
      label: label,
      onChanged: (value) {
        debugPrint('EmailField.onchanged(value: $value)');
        onChanged(value);
      },
      isValidationEnabled: isValidationEnabled,
      validator: (value) {
        debugPrint('EmailField.BaseTextField.validator(value: $value)');
        return Validator.isEmail(value);
      },
    );
  }
}
