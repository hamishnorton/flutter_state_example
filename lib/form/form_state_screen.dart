import 'package:flutter/material.dart';
import 'package:flutter_state_example/form/widgets/password_field.dart';
import 'package:flutter_state_example/form/widgets/phone_field.dart';

import 'widgets/email_value_listenable_field.dart';
import 'widgets/name_field.dart';

class FormStateScreen extends StatefulWidget {
  const FormStateScreen({Key? key}) : super(key: key);

  // Validation on submit
  // based on: https://docs.flutter.dev/cookbook/forms/validation

  @override
  State<FormStateScreen> createState() => _FormStateScreenState();
}

class _FormStateScreenState extends State<FormStateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _submitted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                NameField(
                  controller: _nameController,
                  label: 'Name',
                  validationEnabled: _submitted,
                ),
                EmailValueListenableField(
                  controller: _emailController,
                  label: 'EmailValueListenableField',
                  validationEnabled: _submitted,
                ),
                PhoneField(
                    controller: _phoneController,
                    label: 'Phone',
                    validationEnabled: _submitted),
                PasswordField(
                    controller: _passwordController,
                    label: 'Password',
                    validationEnabled: _submitted),
                // EmailTextFormField(
                //     label: 'EmailTextFormField',
                //     controller: _emailFormFieldController,
                //     validationEnabled: _hasAttemptedSubmit),

                // EmailOnChangedField(
                //   label: 'EmailOnChangeField',
                //   // only needed if you're starting with a specific value from somewhere else
                //   //initialValue: _emailOnChangedFieldValue,
                //   onChanged: (String text) {
                //     _emailOnChangedFieldValue = text;
                //     debugPrint(
                //         '_emailOnChangedFieldValue: $_emailOnChangedFieldValue');
                //   },
                //   validationEnabled: _hasAttemptedSubmit,
                // ),

                ElevatedButton(
                  onPressed: () {
                    // must enable validation before trying to validate
                    setState(() {
                      _submitted = true;
                    });

                    if (_formKey.currentState!.validate()) {
                      debugPrint('validate() == true');
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Processing Data'),
                            Text('Name: ${_nameController.text}'),
                            Text('Email: ${_emailController.text}'),
                            Text('Phone: ${_phoneController.text}'),
                            Text('Password: ${_passwordController.text}'),
                          ],
                        )),
                      );
                    }
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
