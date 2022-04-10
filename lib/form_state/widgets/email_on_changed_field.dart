import 'package:flutter/material.dart';
import 'package:flutter_state_example/form_state/widgets/on_changed_field.dart';
import 'package:flutter_state_example/validator.dart';

class EmailOnChangedField extends StatelessWidget {
  const EmailOnChangedField({
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

  String? _validator(String? value) {
    return Validator.isEmail(value);
  }

  @override
  Widget build(BuildContext context) {
    return OnChangedField(
        initialValue: initialValue,
        label: label,
        hintText: 'name@domain.com',
        onChanged: onChanged,
        validationEnabled: validationEnabled,
        validator: (value) => _validator(value));
  }
}
