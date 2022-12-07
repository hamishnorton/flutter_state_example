import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/theme/styles.dart';

class RiverpodBaseTextField extends ConsumerStatefulWidget {
  const RiverpodBaseTextField({
    super.key,
    required this.hintText,
    this.inputFormatters,
    required this.label,
    required this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    required this.watch,
  });

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Function watch;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiverpodBaseStatefulTextFieldState();
}

class _RiverpodBaseStatefulTextFieldState
    extends ConsumerState<RiverpodBaseTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('RiverpodBaseTextField.build()');

    TextFieldModel fieldModel = ref.watch(widget.watch());
    debugPrint('fieldModel.value: ${fieldModel.value}');
    if (fieldModel.value != controller.text) {
      controller.text = fieldModel.value ?? '';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: Styles.buildInputDecoration(
            fieldModel.error, widget.hintText, widget.label),
        controller: controller,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
      ),
    );
  }
}
