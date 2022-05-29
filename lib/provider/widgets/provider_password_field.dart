import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/provider/widgets/provider_base_text_field.dart';

class ProviderPasswordField extends StatelessWidget {
  const ProviderPasswordField(
      {Key? key, required this.label, required this.model, this.onChanged})
      : super(key: key);

  final String label;
  final TextFieldModel model;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ProviderBaseTextField(
      hintText: 'aB^1',
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[\s\t\n]'))],
      label: label,
      keyboardType: TextInputType.visiblePassword,
      model: model,
      obscureText: true,
      onChanged: onChanged,
    );
  }
}
