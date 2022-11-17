import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/styles.dart';

/// Stateful TextFormField requiring a controller.
/// Has to be stateful so the errorText is updated
/// by onChanged: setState().
/// This feels/look like a bit of an antipattern
/// Consider using BaseTextValueListenableField instead.
class BaseTextFormField extends StatefulWidget {
  // Thought: Could be made to also accept an initialValue and onChanged()
  const BaseTextFormField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.validationEnabled = true,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final bool validationEnabled;
  final String? Function(String?)? validator;

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  String? _validate(String? value) {
    if (widget.validator == null) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    if (!widget.validationEnabled) return null;

    return _validate(widget.controller.value.text);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextFormField.build()');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          setState(() {});
        },
        validator: (value) {
          return _validate(value);
        },
        autovalidateMode: (widget.validationEnabled)
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        decoration: Styles.buildInputDecoration(
            _errorText, widget.hintText, widget.label),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
