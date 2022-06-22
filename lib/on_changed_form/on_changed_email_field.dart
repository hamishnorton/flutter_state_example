import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/on_changed_form/base_text_on_changed_field.dart';
import 'package:flutter_state_example/common/validator.dart';

class OnChangedEmailField extends StatelessWidget {
  const OnChangedEmailField({
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
    debugPrint('EmailOnchangedField.build()');

    return BaseTextOnChangedField(
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
        debugPrint(
            'OnChangedEmailField.BaseTestOnChangedField.validator(value: $value)');
        return Validator.isEmail(value);
      },
    );
  }
}
