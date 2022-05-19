import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for FilteringTextInputFormatter

class CubitField extends StatelessWidget {
  const CubitField({
    Key? key,
    required this.errorText,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue = '',
    this.enableValidation = false,
  }) : super(key: key);

  final String? errorText;
  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Function(String?)? onChanged;
  final bool enableValidation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: TextField(
      //   // TODO: Can this be a TextField, but we need a controller
      //   initialValue: initialValue,
      //   onChanged: onChanged,
      //   inputFormatters: inputFormatters,
      //   decoration: InputDecoration(hintText: hintText, errorText: errorText),
      // ),
      child: TextFormField(
        // TODO: Can this be a TextField
        initialValue: initialValue,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(hintText: hintText, errorText: errorText),
      ),
    );
  }
}
