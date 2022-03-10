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
      appBar: AppBar(title: const Text('stateSystem: Cubit')),
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
                        context.read<FormCubit>().nameChanged(value),
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
                        context.read<FormCubit>().emailChanged(value),
                    errorText: state.email.error,
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (c.phone != p.phone),
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
                        context.read<FormCubit>().phoneChanged(value),
                    errorText: state.phone.error,
                  );
                },
              ),
              BlocBuilder<FormCubit, CubitFormState>(
                buildWhen: (p, c) => (c.password != p.password),
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: state.password.value,
                      // probably not a good practise with a password
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          errorText: state.password.error),
                      onChanged: (value) =>
                          context.read<FormCubit>().passwordChanged(value),
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
                  return ElevatedButton(
                    onPressed: () {
                      FormCubit formCubit = context.read<FormCubit>();
                      formCubit.validated();
                      CubitFormState readState = formCubit.state;

                      if (!(readState.isValid ?? false)) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Processing Data'),
                            Text('Name: ${readState.name.value}'),
                            Text('Email: ${readState.email.value}'),
                            Text('Phone: ${readState.phone.value}'),
                            Text('Password: ${readState.password.value}'),
                          ],
                        )),
                      );
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
