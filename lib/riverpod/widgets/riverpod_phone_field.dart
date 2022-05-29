import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/riverpod/widgets/riverpod_base_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodPhoneField extends ConsumerWidget {
  const RiverpodPhoneField(
      {required this.label, this.onChanged, required this.watch, Key? key})
      : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RiverpodBaseTextField(
      hintText: '+64 21 123 456',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d+()-\s]'))
      ],
      label: label,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      watch: watch,
    );
  }
}
