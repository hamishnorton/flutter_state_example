import 'package:flutter/material.dart';
import 'package:flutter_state_example/common/app_form.dart';

import 'on_changed_form.dart';

class OnChangedScreen extends StatefulWidget {
  const OnChangedScreen({Key? key}) : super(key: key);

  @override
  State<OnChangedScreen> createState() => _OnChangedScreenState();
}

class _OnChangedScreenState extends State<OnChangedScreen> {
  final _formKey = GlobalKey<AppFormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('OnChangedScreen.build()');
    return Scaffold(
      appBar: AppBar(title: const Text('Form with OnChanged Fields')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            OnChangedForm(formKey: _formKey),
            ElevatedButton(
              onPressed: () {
                // debugPrint('OnChangedScreen.onPressed()');
                if (_formKey.currentState!.submit()) {
                  // debugPrint('_formKey.currentState!.submit(): true');
                }
              },
              child: const Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}
