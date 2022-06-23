import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/validator.dart';

import 'base_text_oc_vl_sf_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
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
    debugPrint('EmailField.build()');
    debugPrint('validationEnabled: $validationEnabled');

    return BaseTextOcVlSfField(
      hintText: 'name@domain.com',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      keyboardType: TextInputType.emailAddress,
      label: label,
      onChanged: onChanged,
      validationEnabled: validationEnabled,
      validator: (value) {
        debugPrint('EmailField.validator(value: $value)');
        return Validator.isEmail(value);
      },
    );
  }
}
