import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/provider/widgets/provider_base_text_field.dart';

class ProviderNameField extends StatelessWidget {
  const ProviderNameField(
      {Key? key, required this.label, required this.model, this.onChanged})
      : super(key: key);

  final String label;
  final TextFieldModel model;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ProviderBaseTextField(
      hintText: 'firstname surname',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z-' ']'))
      ],
      label: label,
      keyboardType: TextInputType.name,
      model: model,
      onChanged: onChanged,
    );
  }
}
