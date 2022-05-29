import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/riverpod/widgets/riverpod_base_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField(
      {required this.label, this.onChanged, required this.watch, Key? key})
      : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('PasswordField.build()');

    return RiverpodBaseTextField(
      hintText: 'aB^1',
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\s\t\n]'))],
      label: label,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) => onChanged!(value!),
      watch: watch,
    );
  }
}
