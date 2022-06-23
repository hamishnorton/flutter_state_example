import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/on_changed_form/base_text_field.dart';
import 'package:flutter_state_example/common/validator.dart';

class OnChangedNameField extends StatelessWidget {
  const OnChangedNameField({
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
    debugPrint('OnchangedNameField.build()');

    return BaseTextField(
      hintText: 'firstname surname',
      initialValue: initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z\s-' ']'))
      ],
      label: label,
      keyboardType: TextInputType.name,
      onChanged: onChanged,
      validationEnabled: validationEnabled,
      validator: (value) {
        debugPrint(
            'OnChangedNameField.BaseTestOnChangedField.validator(value: $value)');
        return Validator.isName(value);
      },
    );
  }
}
