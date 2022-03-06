import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/form_cubit.dart';
import 'package:flutter_state_example/cubit/widgets/cubit_field.dart';

class CubitStateScreen extends StatefulWidget {
  const CubitStateScreen({Key? key}) : super(key: key);

  @override
  State<CubitStateScreen> createState() => _CubitStateScreenState();
}

class _CubitStateScreenState extends State<CubitStateScreen> {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit State')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) =>
                    (p.name != c.name), // or compare on name.value
                builder: (context, state) {
                  return CubitField(
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                    initialValue: state.name.value ?? '',
                    onChanged: (value) =>
                        context.read<FormCubit>().nameValidated(value),
                    errorText: state.name.error,
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (p.email != c.email),
                builder: (context, state) {
                  return CubitField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    initialValue: state.email.value ?? '',
                    onChanged: (value) =>
                        context.read<FormCubit>().emailValidated(value),
                    errorText: state.email.error,
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (c.phone.value != p.phone.value),
                builder: (context, state) {
                  return CubitField(
                    hintText: 'Phone',
                    initialValue: state.phone.value ?? '',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                    ],
                    onChanged: (value) =>
                        context.read<FormCubit>().phoneValidated(value),
                    errorText: state.phone.error,
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (c.password.value != p.password.value),
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: state.password.value ?? '',
                      // probably not a good practise with a password
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          errorText: state.password.error),
                      onChanged: (value) =>
                          context.read<FormCubit>().passwordValidated(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (c.isValid != p.isValid),
                builder: (context, state) {
                  print('isValid Changed');
                  return ElevatedButton(
                    onPressed: (state.isValid)
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Processing Data'),
                                  Text('Name: ${state.name.value}'),
                                  Text('Email: ${state.email.value}'),
                                  Text('Phone: ${state.phone.value}'),
                                  Text('Password: ${state.password.value}'),
                                ],
                              )),
                            );
                          }
                        : null,
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
