import 'package:flutter/material.dart';
import 'package:flutter_state_example/form_state/widgets/value_listenable_field.dart';
import 'package:flutter_state_example/validator.dart';

class EmailValueListenableField extends StatefulWidget {
  const EmailValueListenableField({
    Key? key,
    this.initialValue = '',
    required this.label,
    this.onChanged,
    required this.validationEnabled,
  }) : super(key: key);

  final String initialValue;
  final String label;
  final Function(String)? onChanged;
  final bool validationEnabled;

  @override
  State<EmailValueListenableField> createState() =>
      _EmailValueListenableFieldState();
}

class _EmailValueListenableFieldState extends State<EmailValueListenableField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    if (widget.onChanged != null) {
      _controller.addListener(() {
        widget.onChanged!(_controller.value.text);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validator(String? value) {
    return Validator.isEmail(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableField(
      controller: _controller,
      label: widget.label,
      hintText: 'name@domain.com',
      validationEnabled: widget.validationEnabled,
      validator: (value) => _validator(value),
    );
  }
}
