import 'package:flutter/material.dart';
import 'package:flutter_state_example/provider/form_provider.dart';
import 'package:flutter_state_example/provider/provider_form.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  // based on: https://blog.logrocket.com/flutter-form-validation-complete-guide/#input-validation-input-formatters

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
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
      appBar: AppBar(title: const Text('stateSystem: Provider')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProviderForm(formProvider: _formProvider),
              Consumer<FormProvider>(
                builder: (context, model, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (model.isValid) {
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
