import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/theme.dart';
// for FilteringTextInputFormatter

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    required this.errorText,
    required this.hintText,
    this.value = '',
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  final String? errorText;
  final String hintText;
  final String? value;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    debugPrint('BaseTextField.build()');
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Thought:  given this isn't statefule can we use the likes of TextField instead?
      child: TextFormField(
        decoration: Styles.buildInputDecoration(errorText, hintText, label),
        initialValue: value,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}
