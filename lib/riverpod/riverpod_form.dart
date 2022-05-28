import 'package:flutter/material.dart';
import 'package:flutter_state_example/riverpod/widgets/name_field.dart';
import 'package:flutter_state_example/riverpod/widgets/email_field.dart';
import 'package:flutter_state_example/riverpod/widgets/password_field.dart';
import 'package:flutter_state_example/riverpod/widgets/phone_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_model.dart';
import 'riverpod.dart';

// To clean up below in your application you could replace the consumers
// with specific widgets for each of the fields that extends ConsumerWidget
// and is composed of the generic type widget

class RiverPodForm extends ConsumerWidget {
  const RiverPodForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        NameField(
          label: 'Name',
          onChanged: (value) =>
              ref.read(formStateProvider.notifier).nameChanged(value),
          watch: () => formStateProvider.select((f) => f.name),
        ),
        EmailField(
          label: 'Email',
          onChanged: (value) =>
              ref.read(formStateProvider.notifier).emailChanged(value),
          watch: () => formStateProvider.select((f) => f.email),
        ),
        PhoneField(
            label: 'Phone',
            onChanged: (value) =>
                ref.read(formStateProvider.notifier).phoneChanged(value),
            watch: () => formStateProvider.select((f) => f.phone)),
        PasswordField(
            label: 'Password',
            onChanged: (value) =>
                ref.read(formStateProvider.notifier).passwordChanged(value),
            watch: () => formStateProvider.select((f) => f.password)),
        
      ],
    );
  }
}
