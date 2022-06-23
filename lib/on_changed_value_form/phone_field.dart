import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_state_example/common/validator.dart';

import 'base_text_oc_vl_sf_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key? key,
    this.initialValue = '',
    required this.label,
    required this.onChanged,
    required this.validationEnabled,
  }) : super(key: key);

  final String initialValue;
  final String label;
  final Function(String) onChanged;
  final bool validationEnabled;

  @override
  Widget build(BuildContext context) {
    debugPrint('PhoneField.build()');
    debugPrint('validationEnabled: $validationEnabled');

    return BaseTextOcVlSfField(
      hintText: '+64 21 123 456',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d+()-\s]'))
      ],
      label: label,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      validationEnabled: validationEnabled,
      validator: (value) {
        debugPrint('PhoneField.validator(value: $value)');
        return Validator.isPhone(value);
      },
    );
  }
}
