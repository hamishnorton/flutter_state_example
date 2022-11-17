import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/styles.dart';

/// Stateless TextField using ValueListenableBuilder, and requiring a TextEditingController.
/// based on: https://codewithandrea.com/articles/flutter-text-field-form-validation/
class BaseTextValueListenableField extends StatelessWidget {
  const BaseTextValueListenableField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.obscureText = false,
    this.validationEnabled = true,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final bool obscureText;
  final bool validationEnabled;
  final FormFieldValidator? validator;

  String? _validate(String? value) {
    if (validator == null) return null;

    return validator!(value);
  }

  String? get _errorText {
    if (!validationEnabled) return null;

    return _validate(controller.value.text);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextValueListenableField.build()');

    // https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, __, ___) {
        debugPrint('ValueListenableBuilder.builder()');

        return TextFormField(
          autovalidateMode: validationEnabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          controller: controller,
          decoration: Styles.buildInputDecoration(_errorText, hintText, label),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: (value) {
            return _validate(value);
          },
        );
      },
    );
  }
}
