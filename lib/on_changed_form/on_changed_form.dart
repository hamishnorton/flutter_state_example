import 'package:flutter/material.dart';
import 'package:flutter_state_example/common/app_form.dart';

import 'email_field.dart';
import 'name_field.dart';
import 'phone_field.dart';

class OnChangedForm extends StatefulWidget {
  const OnChangedForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<AppFormState> formKey;

  @override
  State<OnChangedForm> createState() => _OnChangedFormState();
}

class _OnChangedFormState extends State<OnChangedForm> {
  String _name = '';
  String _email = '';
  String _phone = '';
  // final String _password = '';

  void _save(AppFormState state) {
    debugPrint('OnChangedForm._save()');
    debugPrint('_name: $_name');
    debugPrint('_email: $_email');
    debugPrint('_phone: $_phone');
  }

  bool _validate() {
    debugPrint('OnChangedForm._validate()');

    // Add inter field validation here
    if (_email.isEmpty && _phone.isEmpty) return false;
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
        // Thought: The form could provide itself with one if not provided
        // But only if the submit() is in the same scope and not a parent
        key: widget.formKey,
        onSaved: (state) => _save(state),
        validate: () => _validate(),
        builder: (state) {
          debugPrint('OnChangedForm.build().AppForm.builder()');
          return Column(children: [
            Text('email: $_name'),
            Text('email: $_email'),
            Text('phone: $_phone'),
            NameField(
              initialValue: _name,
              label: 'Name',
              onChanged: (newValue) {
                //no setState((){}) requried as that happens in the field
                _name = newValue;
              },
              isValidationEnabled: state.submitted,
            ),
            EmailField(
              initialValue: _email,
              label: 'EmailField',
              onChanged: (newValue) {
                 setState(() {
                  // required to update validation on EmailFeild
                  _email = newValue;
                });
              },
              isValidationEnabled: (state.submitted) ? _phone.isEmpty : false,
            ),
            PhoneField(
              initialValue: _phone,
              label: 'PhoneField',
              onChanged: (newValue) {
                 setState(() {
                  // required to update validation on the PhoneField
                  _phone = newValue;
                });
              },
              isValidationEnabled: (state.submitted) ? _email.isEmpty : false,
            ),
          ]);
        });
  }
}
