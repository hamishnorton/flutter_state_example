import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/riverpod/widgets/riverpod_base_text_field.dart';

class RiverpodEmailField extends ConsumerWidget {
  const RiverpodEmailField(
      {required this.label, this.onChanged, required this.watch, Key? key})
      : super(key: key);

  final String label;
  final Function watch;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('RiverpodEmailField.build()');

    return RiverpodBaseTextField(
      hintText: 'name@domain.com',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@.]'))
      ],
      keyboardType: TextInputType.emailAddress,
      label: label,
      onChanged: onChanged,
      watch: watch,
    );
  }
}
