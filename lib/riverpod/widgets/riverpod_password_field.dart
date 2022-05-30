import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/riverpod/widgets/riverpod_base_text_field.dart';

class RiverpodPasswordField extends ConsumerWidget {
  const RiverpodPasswordField(
      {required this.label, this.onChanged, required this.watch, Key? key})
      : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RiverpodBaseTextField(
      hintText: 'aB^1',
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\s\t\n]'))],
      label: label,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: onChanged,
      watch: watch,
    );
  }
}
