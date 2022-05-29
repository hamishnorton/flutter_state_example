import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodBaseTextField extends ConsumerWidget {
  const RiverpodBaseTextField({
    Key? key,
    //required this.fieldModel,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    required this.label,
    this.onChanged,
    required this.watch,
  }) : super(key: key);

  //final TextFieldModel fieldModel;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final TextInputType keyboardType;
  final Function(String?)? onChanged;
  final Function watch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('BaseTextFieldWWithModel.build()');
    TextFieldModel fieldModel = ref.watch(watch());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Thought:  given this isn't statefule can we use the likes of TextField instead?
      // Thought: Can't use TextField as it needs a controller
      // Thought: What if we did use a controller, the watch would update the controller
      child: TextFormField(
        decoration:
            Styles.buildInputDecoration(fieldModel.error, hintText, label),
        initialValue: fieldModel.value,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
      ),
    );
  }
}
