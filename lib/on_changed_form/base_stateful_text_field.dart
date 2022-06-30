import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/theme.dart';

/// Stateful TextFormField requiring an intialValue, and onChanged().
class BaseStatefulTextField extends StatefulWidget {
  const BaseStatefulTextField({
    Key? key,
    this.initialValue = '',
    required this.onChanged,
    this.hintText = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.isValidationEnabled = true,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String label;
  final Function(String) onChanged;
  final bool isValidationEnabled;
  final FormFieldValidator? validator;

  @override
  State<BaseStatefulTextField> createState() => _BaseStatefulTextFieldState();
}

class _BaseStatefulTextFieldState extends State<BaseStatefulTextField> {
  late String _value;

  @override
  initState() {
    super.initState();
    // debugPrint('BaseStatefulTextField.initState');
    _value = widget.initialValue;
  }

  String? _validate(String? value) {
    // debugPrint('BaseTextField._validate(value: $value)');
    if (widget.validator == null) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    debugPrint('BaseTextField._errorText');
    if (!widget.isValidationEnabled) return null;
    // debugPrint('_errorText validationEnabled: ${widget.isValidationEnabled}');
    return _validate(_value);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextField.build()');
    debugPrint('label: ${widget.label}');
    debugPrint('validationEnabled: ${widget.isValidationEnabled}');
    debugPrint('initialValue: ${widget.initialValue}');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: (text) {
          debugPrint('BaseTextField.TextFormField.onChanged(text: $text)');

          if (widget.validator != null && widget.validator!(text) != null) {
            // is NOT valid
            widget.onChanged('');
          } else {
            // is Valid
            widget.onChanged(text);
          }
          // if (widget.validator == null) {
          //   widget.onChanged(text);
          // } else if (widget.validator!(text) == null) {
          //   widget.onChanged(text);
          // } else {
          //   widget.onChanged('');
          // }

          // enables _errorText is rebuild based on the new value
          setState(() {
            _value = text;
          });
        },
        // no validator required as setting the errorText in
        // the decorator runs the the validation callback
        // validator: (value) {}
        // no autovalidateMode required as the errorText is set on every build
        // autovalidateMode: widget.isValidationEnabled
        //     ? AutovalidateMode.onUserInteraction
        //     //? AutovalidateMode.always
        //     : AutovalidateMode.disabled,
        decoration: Styles.buildInputDecoration(
            _errorText, widget.hintText, widget.label),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
