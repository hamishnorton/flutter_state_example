import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for FilteringTextInputFormatter

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
