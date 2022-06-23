import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/theme.dart';

/// Stateful TextFormField requiring an intialValue, and onChanged().
/// identical to BaseTextFormField, but uses initialValue, and onChanged().
class BaseTextOcVlSfField extends StatefulWidget {
  const BaseTextOcVlSfField({
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
  State<BaseTextOcVlSfField> createState() => _BaseTextOcVlSfFieldState();
}

class _BaseTextOcVlSfFieldState extends State<BaseTextOcVlSfField> {
  //late String _value;
  late final TextEditingController controller;

  @override
  initState() {
    super.initState();
    //_value = widget.initialValue;
    controller = TextEditingController(text: widget.initialValue)
      ..addListener(() {
        debugPrint('BaseTextOcVlSfField..addListener(){}');
        // Only fire onChanged if validatej
        if (!widget.validationEnabled) {
          debugPrint('validationEnabled: false');
          widget.onChanged(controller.text);
        }

        if (widget.validator!(controller.text) == null) {
          debugPrint('validator != null: true');
          widget.onChanged(controller.text);
        }
      });
  }

  String? _validate(String? value) {
    debugPrint('BaseTextOcVlSfField._validate(value: $value)');
    if (widget.validator == null) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    debugPrint('BaseTextOcVlSfField._errorText');
    if (!widget.validationEnabled) return null;
    debugPrint('validationEnabled: ${widget.validationEnabled}');
    return _validate(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextOcVlSfField.build()');

    // https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, __, ___) {
        debugPrint('ValueListenableBuilder.builder()');

        return TextFormField(
          autovalidateMode: widget.validationEnabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          controller: controller,

          decoration: Styles.buildInputDecoration(
              _errorText, widget.hintText, widget.label),
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          //obscureText: widget.obscureText,
          validator: (value) {
            return _validate(value);
          },
        );
      },
    );
  }
}
