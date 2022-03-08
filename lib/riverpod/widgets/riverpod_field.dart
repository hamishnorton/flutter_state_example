import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for FilteringTextInputFormatter

class RiverPodField extends StatelessWidget {
  const RiverPodField({
    Key? key,
    required this.errorText,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue = '',
  }) : super(key: key);

  final String? errorText;
  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(hintText: hintText, errorText: errorText),
      ),
    );
  }
}
