import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/theme.dart';

/// Stateful TextFormField requiring an intialValue, and onChanged().
/// identical to BaseTextFormField, but uses initialValue, and onChanged().
class BaseTextOnChangedField extends StatefulWidget {
  const BaseTextOnChangedField({
    Key? key,
    this.initialValue = '',
    required this.onChanged,
    this.hintText = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.validationEnabled = true,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final Function(String) onChanged;
  final bool validationEnabled;
  final FormFieldValidator? validator;

  @override
  State<BaseTextOnChangedField> createState() => _BaseTextOnChangedFieldState();
}

class _BaseTextOnChangedFieldState extends State<BaseTextOnChangedField> {
  late String _value;

  @override
  initState() {
    super.initState();
    _value = widget.initialValue;
  }

  String? _validate(String? value) {
    if (widget.validator == null) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    if (!widget.validationEnabled) return null;

    return _validate(_value);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextOnChangeField.build()');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
        autovalidateMode: widget.validationEnabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        decoration: Styles.buildInputDecoration(
            _errorText, widget.hintText, widget.label),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
