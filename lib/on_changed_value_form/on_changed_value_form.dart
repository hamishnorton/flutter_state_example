import 'package:flutter/material.dart';
import 'package:flutter_state_example/common/app_form.dart';

import 'email_field.dart';
import 'phone_field.dart';

class OnChangedValueForm extends StatefulWidget {
  const OnChangedValueForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<AppFormState> formKey;

  @override
  State<OnChangedValueForm> createState() => _OnChangedValueFormState();
}

class _OnChangedValueFormState extends State<OnChangedValueForm> {
  final String _name = '';
  String _email = '';
  String _phone = '';
  // final String _password = '';

  void _save(AppFormState state) {
    debugPrint('OnChangedForm._save()');
    debugPrint('_name: $_name');
    debugPrint('OnChangedForm._save() _email: $_email');
    debugPrint('_phone: $_phone');
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
            // OnChangedNameField(
            //   initialValue: _name,
            //   label: 'Name',
            //   onChanged: (newValue) {
            //     //no setState((){}) requried as that happens in the field
            //     _name = newValue;
            //   },
            //   validationEnabled: state.submitted,
            // ),
            EmailField(
                initialValue: _email,
                label: 'EmailField',
                onChanged: (newValue) {
                  debugPrint(
                      'OnChangedForm.OnChangedEmailField.onChanged(newValue: $newValue)');

                  setState(() {
                    // required to update validation of the PhoneField
                    _email = newValue;
                  });
                },
                validationEnabled: state.submitted
                // todo: inter field validation
                //validationEnabled: (state.submitted) ? _phone.isEmpty : false,
                ),
            PhoneField(
              initialValue: _phone,
              label: 'Phone',
              onChanged: (newValue) {
                debugPrint(
                    'OnChangedForm.OnChangedPhoneField.onChanged(newValue: $newValue)');
                setState(() {
                  _phone = newValue;
                });
              },
              validationEnabled: state.submitted,
              //validationEnabled: (state.submitted) ? _email.isEmpty : false,
            ),
            // ValueListenablePasswordField(
            //     controller: _password,
            //     label: 'Password',
            //     validationEnabled: state.submitted),
          ]);
        });
  }
}
