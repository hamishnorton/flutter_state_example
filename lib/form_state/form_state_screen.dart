import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/form_state/widgets/custom_form_field.dart';
import 'package:flutter_state_example/validator.dart';

class FormStateScreen extends StatefulWidget {
  const FormStateScreen({Key? key}) : super(key: key);

  // Validation on submit
  // but uses autovalidate to provide validation as you type
  // https://docs.flutter.dev/cookbook/forms/validation

  @override
  State<FormStateScreen> createState() => _FormStateScreenState();
}

class _FormStateScreenState extends State<FormStateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      //print('email: ${_emailController.text}');
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form State')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return Validator.isName(value);
                    }),
                CustomFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return Validator.isEmail(value);
                  },
                  hintText: 'Email',
                ),
                CustomFormField(
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return Validator.isPhone(value);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                    FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                ),
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
                        const SnackBar(content: Text('Processing Data')),
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
