import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/provider/form_provider.dart';
import 'package:flutter_state_example/provider/widgets/provider_field.dart';
import 'package:provider/provider.dart';

class ProviderStateScreen extends StatefulWidget {
  const ProviderStateScreen({Key? key}) : super(key: key);

  // Validation as you type
  // https://blog.logrocket.com/flutter-form-validation-complete-guide/#input-validation-input-formatters

  @override
  State<ProviderStateScreen> createState() => _ProviderStateScreenState();
}

class _ProviderStateScreenState extends State<ProviderStateScreen> {
  late FormProvider _formProvider;

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
    _formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider State')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProviderField(
                hintText: 'Name',
                keyboardType: TextInputType.name,
                initialValue: _formProvider.name.value ?? '',
                onChanged: _formProvider.validateName,
                errorText: _formProvider.name.error,
              ),
              ProviderField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                initialValue: _formProvider.email.value ?? '',
                onChanged: _formProvider.validateEmail,
                errorText: _formProvider.email.error,
              ),
              ProviderField(
                hintText: 'Phone',
                initialValue: _formProvider.phone.value ?? '',
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                  FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                ],
                onChanged: _formProvider.validatePhone,
                errorText: _formProvider.phone.error,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _formProvider.password.value ??
                      '', // probably not a good practise with a password
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: _formProvider.password.error),
                  onChanged: _formProvider.validatePassword,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                ),
              ),
              Consumer<FormProvider>(
                builder: (context, model, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (model.validate) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Processing Data'),
                              Text('Name: ${model.name.value}'),
                              Text('Email: ${model.email.value}'),
                              Text('Phone: ${model.phone.value}'),
                              Text('Password: ${model.password.value}'),
                            ],
                          )),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
