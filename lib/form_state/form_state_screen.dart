import 'package:flutter/material.dart';
import 'package:flutter_state_example/form_state/widgets/email_on_changed_field.dart';
import 'package:flutter_state_example/form_state/widgets/email_value_listenable_field.dart';

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
  String _onChangedFieldValue = '';
  bool _hasAttemptedSubmit = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      //print('email: ${_emailController.text}');
    });
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
    return Scaffold(
      appBar: AppBar(title: const Text('stateSystem: Form')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // CustomFormField(
                //     controller: _nameController,
                //     hintText: 'Name',
                //     keyboardType: TextInputType.name,
                //     validationEnabled: _hasAttemptedSubmit,
                //     validator: (value) {
                //       return Validator.isName(value);
                //     }),
                // CustomFormField(
                //   controller: _emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   validationEnabled: _hasAttemptedSubmit,
                //   validator: (value) {
                //     return Validator.isEmail(value);
                //   },
                //   hintText: 'Email',
                // ),
                // ValueListenableField(
                //   controller: _emailController,
                //   label: 'ValueListenableField:Email',
                //   validationEnabled: _hasAttemptedSubmit,
                //   validator: (value) {
                //     return Validator.isEmail(value);
                //   },
                // ),
                // OnChangedField(
                //   validationEnabled: _hasAttemptedSubmit,
                //   validator: (value) {
                //     return Validator.isEmail(value);
                //   },
                //   label: 'OnChangeField:Email',
                //   onChanged: (String text) {
                //     _onChangedFieldValue = text;
                //   },
                // ),
                EmailValueListenableField(
                    label: 'EmailValueListenableField',
                    onChanged: (value) {
                      // not typically what you'd want to do.
                      _emailController.text = value;
                    },
                    validationEnabled: _hasAttemptedSubmit),
                EmailOnChangedField(
                    label: 'EmailOnChangedField',
                    onChanged: (String text) {
                      _onChangedFieldValue = text;
                    },
                    validationEnabled: _hasAttemptedSubmit),
                // CustomFormField(
                //   controller: _phoneController,
                //   hintText: 'Phone',
                //   keyboardType: TextInputType.phone,
                //   validationEnabled: _hasAttemptedSubmit,
                //   validator: (value) {
                //     return Validator.isPhone(value);
                //   },
                //   inputFormatters: [
                //     FilteringTextInputFormatter.singleLineFormatter,
                //     FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                //   ],
                // ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     controller: _passwordController,
                //     validator: _hasAttemptedSubmit
                //         ? (value) {
                //             return Validator.isPassword(value);
                //           }
                //         : null,
                //     obscureText: true,
                //     autovalidateMode: (_hasAttemptedSubmit)
                //         ? AutovalidateMode.always
                //         : AutovalidateMode.disabled,
                //     decoration: const InputDecoration(hintText: 'Password'),
                //   ),
                // ),
                // CustomImageFormField(
                //     validator: (value) {
                //       if (value == null) return 'Pick a picture';
                //       return null;
                //     },
                //     onChanged: (_file) {}),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      //print('Name: ${}');
                      //print('Email: ${_emailController.text}');
                      // print('Phome: ${}');
                      // print('Password: ${}');
                      // print('File: ${}');

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
                            Text('OnChangedField: $_onChangedFieldValue'),
                          ],
                        )),
                      );
                      setState(() {
                        _hasAttemptedSubmit = true;
                      });
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
