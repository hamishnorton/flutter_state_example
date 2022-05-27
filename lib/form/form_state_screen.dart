import 'package:flutter/material.dart';
import 'package:flutter_state_example/form/app_form.dart';
import 'package:flutter_state_example/form/form_state_form.dart';

class FormStateScreen extends StatefulWidget {
  const FormStateScreen({Key? key}) : super(key: key);

  @override
  State<FormStateScreen> createState() => _FormStateScreenState();
}

class _FormStateScreenState extends State<FormStateScreen> {
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
    debugPrint('FormStateScreen.build()');
    return Scaffold(
      appBar: AppBar(title: const Text('stateSystem: Form')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            FormStateForm(formKey: _formKey),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState!.submit();
              },
              child: const Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}
