import 'package:flutter/material.dart';
import 'package:flutter_state_example/riverpod/form_model.dart';
import 'package:flutter_state_example/riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'riverpod_form.dart';

class RiverPodScreen extends StatelessWidget {
  const RiverPodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('stateSystem: RiverPod')),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(8.0), child: RiverPodForm()),
            Consumer(
              builder: (context, ref, child) {
                // option to listen for when the form becomes valid
                // bool isValid =
                //     ref.watch(formStateProvider.select((f) => f.isValid ?? false));
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
        ),
      ),
    );
  }
}
