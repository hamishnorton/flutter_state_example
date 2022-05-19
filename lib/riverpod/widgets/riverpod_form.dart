import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../form_model.dart';
import '../riverpod.dart';
import '../validation_model.dart';
import 'riverpod_field.dart';

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
        Consumer(
          builder: (context, ref, child) {
            ValidationModel name =
                ref.watch(formStateProvider.select((f) => f.name));
            return RiverPodField(
              hintText: 'Name',
              keyboardType: TextInputType.name,
              initialValue: name.value ?? '',
              onChanged: (value) =>
                  ref.read(formStateProvider.notifier).nameChanged(value),
              errorText: name.error,
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            ValidationModel email =
                ref.watch(formStateProvider.select((f) => f.email));
            return RiverPodField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              initialValue: email.value ?? '',
              onChanged: (value) =>
                  ref.read(formStateProvider.notifier).emailChanged(value),
              errorText: email.error,
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            ValidationModel phone =
                ref.watch(formStateProvider.select((f) => f.phone));
            return RiverPodField(
              hintText: 'Phone',
              initialValue: phone.value ?? '',
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
              ],
              onChanged: (value) =>
                  ref.read(formStateProvider.notifier).phoneChanged(value),
              errorText: phone.error,
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            ValidationModel password =
                ref.watch(formStateProvider.select((f) => f.password));
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: password.value ?? '',
                // probably not a good practise with a password
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', errorText: password.error),
                onChanged: (value) =>
                    ref.read(formStateProvider.notifier).passwordChanged(value),
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            bool isValid =
                ref.watch(formStateProvider.select((f) => f.isValid ?? false));
            return ElevatedButton(
              onPressed: () {
                ref.read(formStateProvider.notifier).validated();
                FormModel fm = ref.read(formStateProvider);

                if (!(fm.isValid ?? false)) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Processing Data'),
                      Text('Name: ${fm.name.value}'),
                      Text('Email: ${fm.email.value}'),
                      Text('Phone: ${fm.phone.value}'),
                      Text('Password: ${fm.password.value}'),
                    ],
                  )),
                );
              },
              child: const Text('Submit'),
            );
          },
        )
      ],
    );
  }
}
