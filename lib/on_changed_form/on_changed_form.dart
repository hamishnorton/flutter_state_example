import 'package:flutter/material.dart';
import 'package:flutter_state_example/form/app_form.dart';

import 'on_changed_email_field.dart';

class OnChangedForm extends StatefulWidget {
  const OnChangedForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<AppFormState> formKey;

  @override
  State<OnChangedForm> createState() => _OnChangedFormState();
}

class _OnChangedFormState extends State<OnChangedForm> {
  //final String _name = '';
  String _email = '';
  // final String _phone = '';
  // final String _password = '';

  void _save(AppFormState state) {
    debugPrint('_save()');
    //debugPrint('_name: $_name');
    debugPrint('_save() _email: $_email');
    // debugPrint('_phone: $_phone');
    // debugPrint('_password: $_password');
  }

  bool _validate() {
    // Add inter field validation here
    debugPrint('OnChangedForm._validate()');
    //TODO: Add form validation message
    return true;
  }

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
    debugPrint('OnChangedForm.build()');
    return AppForm(
        key: widget
            .formKey, //Thought: Could the form supply itself with one if it's not provided?
        // Only if the submit() is havving in the same scope and not in the screen above
        onSaved: (state) => _save(state),
        validate: () => _validate(),
        builder: (state) {
          debugPrint('OnChangedForm.build().AppForm.builder()');
          return Column(children: [
            // ValueListenableNameField(
            //   controller: _name,
            //   label: 'Name',
            //   validationEnabled: state.submitted,
            // ),
            OnChangedEmailField(
              initialValue: _email,
              label: 'EmailField',
              onChanged: (newValue) {
                debugPrint(
                    'OnChangedForm.OnChangedEmailField.onChanged(newValue: $newValue)');
                //no setState((){}) requried as that happens in the field
                _email = newValue;
              },
              validationEnabled: state.submitted,
            ),
            // ValueListenablePhoneField(
            //     controller: _phone,
            //     label: 'Phone',
            //     validationEnabled: state.submitted),
            // ValueListenablePasswordField(
            //     controller: _password,
            //     label: 'Password',
            //     validationEnabled: state.submitted),
          ]);
        });
  }
}
