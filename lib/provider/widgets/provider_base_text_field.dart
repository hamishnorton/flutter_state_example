import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/theme/styles.dart';
// for FilteringTextInputFormatter

class ProviderBaseTextField extends StatelessWidget {
  const ProviderBaseTextField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.model,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final TextInputType keyboardType;
  final TextFieldModel model;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    debugPrint('ProviderBaseTextField.build()');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Thought:  given this isn't statefule can we use the likes of TextField instead?
      child: TextFormField(
        decoration: Styles.buildInputDecoration(model.error, hintText, label),
        initialValue: model.value,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}
