import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_example/common/value_objects/text_field_model.dart';
import 'package:flutter_state_example/provider/widgets/provider_base_text_field.dart';

class ProviderPhoneField extends StatelessWidget {
  const ProviderPhoneField(
      {Key? key, required this.label, required this.model, this.onChanged})
      : super(key: key);

  final String label;
  final TextFieldModel model;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ProviderBaseTextField(
      hintText: '+64 21 123 456',
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d+()-\s]'))
      ],
      label: label,
      keyboardType: TextInputType.phone,
      model: model,
      onChanged: onChanged,
    );
  }
}
