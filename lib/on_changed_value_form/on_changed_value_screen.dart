import 'package:flutter/material.dart';
import 'package:flutter_state_example/common/app_form.dart';

import 'on_changed_value_form.dart';

class OnChangedValueScreen extends StatefulWidget {
  const OnChangedValueScreen({Key? key}) : super(key: key);

  @override
  State<OnChangedValueScreen> createState() => _OnChangedValueScreenState();
}

class _OnChangedValueScreenState extends State<OnChangedValueScreen> {
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
    debugPrint('OnChangedValueScreen.build()');
    return Scaffold(
      appBar: AppBar(
          title: const Text('Form with OnChanged ValueListenable Fields')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            OnChangedValueForm(formKey: _formKey),
            ElevatedButton(
              onPressed: () {
                debugPrint('OnChangedValueScreen.onPressed()');
                final submitSuccess = _formKey.currentState!.submit();
                debugPrint(
                    'OnChangedValueScreen.onPressed() submitSuccess: $submitSuccess');
              },
              child: const Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}
