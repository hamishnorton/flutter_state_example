import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/form/widgets/base_text_value_listenable_field.dart';
import 'package:flutter_state_example/common/validator.dart';

class ValueListenablePhoneField extends StatelessWidget {
  const ValueListenablePhoneField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validationEnabled})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool validationEnabled;

  @override
  Widget build(BuildContext context) {
    return BaseTextValueListenableField(
      controller: controller,
      hintText: '+64 21 123 456',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d+()-\s]'))
      ],
      label: label,
      keyboardType: TextInputType.phone,
      validationEnabled: validationEnabled,
      validator: (value) {
        // Thought: If this is the only usage of the validator consider adding it to this Widget as a static method so it can be unit tested.
        return Validator.isPhone(value);
      },
    );
  }
}
