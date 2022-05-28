import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/riverpod/widgets/base_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField(
      {required this.label, this.onChanged, required this.watch, Key? key})
      : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('EmailField.build()');

    return BaseTextField(
      hintText: 'name@domain.com',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      label: label,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => onChanged!(value!),
      watch: watch,
    );
  }
}
