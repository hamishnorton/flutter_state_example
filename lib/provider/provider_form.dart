import 'package:flutter/material.dart';
import 'package:flutter_state_example/provider/form_provider.dart';
import 'package:flutter_state_example/provider/widgets/provider_email_field.dart';
import 'package:flutter_state_example/provider/widgets/provider_name_field.dart';
import 'package:flutter_state_example/provider/widgets/provider_password_field.dart';
import 'package:flutter_state_example/provider/widgets/provider_phone_field.dart';

class ProviderForm extends StatelessWidget {
  const ProviderForm({Key? key, required this.formProvider}) : super(key: key);

  final FormProvider formProvider;
  @override
  Widget build(BuildContext context) {
    debugPrint('ProviderForm.build()');

    return Column(
      children: [
        ProviderNameField(
          label: 'Name',
          model: formProvider.name,
          onChanged: formProvider.nameChanged,
        ),
        ProviderEmailField(
          label: 'Email',
          model: formProvider.email,
          onChanged: formProvider.emailChanged,
        ),
        ProviderPhoneField(
          label: 'Phone',
          model: formProvider.phone,
          onChanged: formProvider.phoneChanged,
        ),
        ProviderPasswordField(
          label: 'Password',
          model: formProvider.password,
          onChanged: formProvider.passwordChanged,
        ),
      ],
    );
  }
}
