import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/cubit/form_cubit.dart';
import 'package:flutter_state_example/cubit/cubit_form.dart';

class CubitScreen extends StatefulWidget {
  const CubitScreen({Key? key}) : super(key: key);

  @override
  State<CubitScreen> createState() => _CubitScreenState();
}

class _CubitScreenState extends State<CubitScreen> {
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
              const CubitForm(),
              BlocBuilder<FormCubit, FormCubitState>(
                buildWhen: (p, c) => (c.isValid != p.isValid),
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      FormCubit formCubit = context.read<FormCubit>();
                      formCubit.validated();
                      FormCubitState readState = formCubit.state;

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
