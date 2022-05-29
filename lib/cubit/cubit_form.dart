import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/cubit/form_cubit.dart';
import 'package:flutter_state_example/cubit/widgets/cubit_base_text_field.dart';

class CubitForm extends StatelessWidget {
  const CubitForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('CubildForm.build()');

    return Column(
      children: [
        // I tried to inject a callback for the BlocBuilder
        // to pass it into the CubitBastTextField,
        // but the callback became complicated,
        // and thus not obvious
        BlocBuilder<FormCubit, FormCubitState>(
          buildWhen: (p, c) => (p.name != c.name), // or compare on name.value
          builder: (context, state) {
            return CubitBaseTextField(
              label: 'Name',
              hintText: 'firstname surname',
              keyboardType: TextInputType.name,
              model: state.name,
              onChanged: (value) =>
                  context.read<FormCubit>().nameChanged(value),
            );
          },
        ),
        BlocBuilder<FormCubit, FormCubitState>(
          buildWhen: (p, c) => (p.email != c.email),
          builder: (context, state) {
            return CubitBaseTextField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              hintText: 'name@domain.com',
              onChanged: (value) =>
                  context.read<FormCubit>().emailChanged(value),
              model: state.email,
            );
          },
        ),
        BlocBuilder<FormCubit, FormCubitState>(
          buildWhen: (p, c) => (c.phone != p.phone),
          builder: (context, state) {
            return CubitBaseTextField(
              label: 'Phone',
              hintText: '+62 21 123 456',
              model: state.phone,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
              ],
              onChanged: (value) =>
                  context.read<FormCubit>().phoneChanged(value),
            );
          },
        ),
        BlocBuilder<FormCubit, FormCubitState>(
          buildWhen: (p, c) => (c.password != p.password),
          builder: (context, state) {
            return CubitBaseTextField(
              label: 'Password',
              hintText: 'aB^1',
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              model: state.password,
              obscureText: true,
              onChanged: (value) =>
                  context.read<FormCubit>().passwordChanged(value),
            );
          },
        ),
      ],
    );
  }
}
