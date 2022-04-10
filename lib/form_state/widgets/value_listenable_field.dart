import 'package:flutter/material.dart';
import 'package:flutter_state_example/theme/theme.dart';

class ValueListenableField extends StatefulWidget {
  const ValueListenableField({
    Key? key,
    required this.controller,
    this.hintText = '',
    required this.label,
    required this.validationEnabled,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool validationEnabled;
  final FormFieldValidator? validator;

  @override
  State<ValueListenableField> createState() => _ValueListenableFieldState();
}

class _ValueListenableFieldState extends State<ValueListenableField> {
  String? _validate(String? value) {
    if (widget.validator == null) return null;
    if (!widget.validationEnabled) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    return _validate(widget.controller.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (_, __, ___) {
        // The only apparent benifet to using a TextField
        // is that the validator doesn't get fire twice on a build
        // however with a validator the form can validate the field
        // return TextField(
        //     controller: widget.controller,
        //     decoration: Styles.buildInputDecoration(widget.label, _errorText));
        return TextFormField(
          controller: widget.controller,
          decoration: Styles.buildInputDecoration(
              _errorText, widget.hintText, widget.label),
          autovalidateMode: widget.validationEnabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          validator: (value) {
            return _validate(value);
          },
        );
      },
    );
  }
}
