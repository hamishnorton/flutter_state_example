import 'package:flutter/material.dart';
import 'package:flutter_state_example/common/app_form.dart';

import 'email_field.dart';
import 'form_model.dart';
import 'name_field.dart';
import 'phone_field.dart';

class OnChangedForm extends StatefulWidget {
  const OnChangedForm({Key? key, required this.formKey, required this.onSubmit}) : super(key: key);

  final GlobalKey<AppFormState> formKey;
  final Function(FormModel formModel) onSubmit;

  @override
  State<OnChangedForm> createState() => _OnChangedFormState();
}

class _OnChangedFormState extends State<OnChangedForm> {
  String name = '';
  String email = '';
  String phone = '';

  void _save(AppFormState state) {
    debugPrint('OnChangedForm._save()');
    debugPrint('_name: $name');
    debugPrint('_email: $email');
    debugPrint('_phone: $phone');

    widget.onSubmit(FormModel(name, email, phone, ''));
  }

  String? _validator() {
    debugPrint('OnChangedForm._validator()');

    // Add inter field validation here
    if (email.isEmpty && phone.isEmpty) {
      return 'Either Email or Phone is required';
    }

    return null;
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
        validator: () => _validator(),
        builder: (state) {
          debugPrint('OnChangedForm.build().AppForm.builder()');
          return Column(children: [
            Text('name: $name'),
            Text('email: $email'),
            Text('phone: $phone'),
            const Text('^above only changes on a setState() of the form'),
            NameField(
              initialValue: name,
              label: 'Name',
              onChanged: (newValue) {
                debugPrint('NameField.onChanged(newValue: $newValue)');
                //no setState((){}) requried as that happens in the field
                name = newValue;
              },
              isValidationEnabled: state.submitted,
            ),
            EmailField(
              initialValue: email,
              label: 'EmailField',
              onChanged: (newValue) {
                setState(() {
                  // required to update validation on EmailFeild
                  email = newValue;
                });
              },
              isValidationEnabled: (state.submitted) ? phone.isEmpty : false,
            ),
            PhoneField(
              initialValue: phone,
              label: 'PhoneField',
              onChanged: (newValue) {
                setState(() {
                  // required to update validation on the PhoneField
                  phone = newValue;
                });
              },
              isValidationEnabled: (state.submitted) ? email.isEmpty : false,
            ),
            if (!state.isValid)
              Text(
                state.errorText,
                // TODO: What is the error text in a MaterialTheme?
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
              ),
            // ElevatedButton(
            //     onPressed: () {
            //       state.submit();
            //     },
            //     child: const Text('submit'))
          ]);
        });
  }
}
