import 'package:flutter/material.dart';
import 'package:flutter_state_example/form/app_form.dart';
import 'package:flutter_state_example/form/widgets/email_value_listenable_field.dart';
import 'package:flutter_state_example/form/widgets/value_listenable_name_field.dart';
import 'package:flutter_state_example/form/widgets/value_listenable_password_field.dart';
import 'package:flutter_state_example/form/widgets/value_listenable_phone_field.dart';

class FormStateForm extends StatefulWidget {
  const FormStateForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<AppFormState> formKey;

  @override
  State<FormStateForm> createState() => _FormStateFormState();
}

class _FormStateFormState extends State<FormStateForm> {
  //final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _save(AppFormState state) {
    debugPrint('Saving...');
    debugPrint('_nameController.text: ${_nameController.text}');
    debugPrint('_emailController.text: ${_emailController.text}');
    debugPrint('_phoneController.text: ${_phoneController.text}');
    debugPrint('_passwordController.text: ${_passwordController.text}');
  }

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
    debugPrint('FormStateForm.build()');
    return AppForm(
        key: widget.formKey,
        onSaved: (state) => _save(state),
        builder: (state) {
          debugPrint('AppForm.builder:');
          return Column(children: [
            ValueListenableNameField(
              controller: _nameController,
              label: 'Name',
              validationEnabled: state.submitted,
            ),
            EmailValueListenableField(
              controller: _emailController,
              label: 'EmailValueListenableField',
              validationEnabled: state.submitted,
            ),
            ValueListenablePhoneField(
                controller: _phoneController,
                label: 'Phone',
                validationEnabled: state.submitted),
            ValueListenablePasswordField(
                controller: _passwordController,
                label: 'Password',
                validationEnabled: state.submitted),
          ]);
        });
  }
}
