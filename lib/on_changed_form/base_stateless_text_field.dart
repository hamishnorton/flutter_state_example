import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/theme.dart';

/// Don't use this!
/// Requires setState((){}) to be included in the onChanged callback
/// note: Doesn't work as a pair on the same value, might need a ValueKey()
class BaseStatelessTextField extends StatelessWidget {
  const BaseStatelessTextField({
    Key? key,
    this.initialValue = '',
    required this.onChanged,
    this.hintText = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.isValidationEnabled = true,
    this.validator,
    this.stateKey,
  }) : super(key: key);

  final Key? stateKey;
  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final Function(String) onChanged;
  final bool isValidationEnabled;
  final FormFieldValidator? validator;

  String? _validate(String? value) {
    debugPrint('BaseStatelessTextField._validate(value: $value)');
    if (validator == null) return null;

    return validator!(value);
  }

  String? get _errorText {
    debugPrint('BaseStatelessTextField._errorText');
    if (!isValidationEnabled) return null;
    debugPrint(
        'BaseTextOCField._errorText validationEnabled: $isValidationEnabled');
    return _validate(initialValue);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseStatelessTextField.build()');
    debugPrint('label: $label');
    debugPrint('validationEnabled: $isValidationEnabled');
    debugPrint('initialValue: $initialValue');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: stateKey,
        initialValue: initialValue,
        onChanged: (text) {
          debugPrint(
              'BaseStatelessTextField.TextFormField.onChanged(text: $text)');

          if (validator == null) {
            onChanged(text); // no validator so assume it valid
          } else {
            final errorText = validator!(text);
            if (errorText == null) {
              debugPrint('validator!(text) == null //it\'s Valid');
              onChanged(text);
            } else {
              onChanged('');
            }
          }
        },
        validator: (value) {
          debugPrint(
              'BaseStatelessTextField.TextFormField.validator(value: $value)');
          return _validate(value);
        },
        autovalidateMode: isValidationEnabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        decoration: Styles.buildInputDecoration(_errorText, hintText, label),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
      ),
    );
  }
}
