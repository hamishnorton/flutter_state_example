import 'package:flutter/material.dart';
import 'package:flutter_state_example/theme/theme.dart';

class OnChangedField extends StatefulWidget {
  const OnChangedField({
    Key? key,
    this.hintText = '',
    this.initialValue = '',
    required this.label,
    required this.onChanged,
    required this.validationEnabled,
    required this.validator,
  }) : super(key: key);

  final String hintText;
  final String initialValue;
  final String label;
  final Function(String) onChanged;
  final FormFieldValidator? validator;
  final bool validationEnabled;

  @override
  State<OnChangedField> createState() => _OnChangedFieldState();
}

class _OnChangedFieldState extends State<OnChangedField> {
  late String _value;
  @override
  initState() {
    super.initState();
    _value = widget.initialValue;
  }

  String? _validate(String? value) {
    if (widget.validator == null) return null;
    if (!widget.validationEnabled) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    return _validate(_value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.validationEnabled
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      decoration: Styles.buildInputDecoration(
          _errorText, widget.hintText, widget.label),
      initialValue: widget.initialValue,
      onChanged: (text) {
        widget.onChanged(text);
        setState(() {
          _value = text;
        });
      },
      validator: (value) {
        return _validate(value);
      },
    );
  }
}
