import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/riverpod/widgets/riverpod_base_text_field.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    required this.label,
    this.onChanged,
    required this.watch,
  }) : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RiverpodBaseTextField(
      hintText: 'firstname surname',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z-' ']'))
      ],
      label: label,
      keyboardType: TextInputType.name,
      onChanged: (value) => onChanged!(value!),
      watch: watch,
    );
  }
}
