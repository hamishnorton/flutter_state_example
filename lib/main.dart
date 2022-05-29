import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/cubit/form_cubit.dart';
import 'package:flutter_state_example/cubit/cubit_screen.dart';
import 'package:flutter_state_example/extensions/extensions.dart';
import 'package:flutter_state_example/form/form_state_screen.dart';
import 'package:flutter_state_example/provider/form_provider.dart';
import 'package:flutter_state_example/provider/provider_screen.dart';
import 'package:flutter_state_example/riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;

enum StateSystem { form, cubit, provider, riverPod }

void main() {
  const value = String.fromEnvironment('FSE_TYPE');
  debugPrint('FSE_TYPE: $value');
  final lowerTrimmed = value.toLowerCase().trim();
  StateSystem stateSystem =
      lowerTrimmed.toEnum<StateSystem>(StateSystem.values);
  //StateSystem stateSystem = StateSystem.riverPod;

  switch (stateSystem) {
    case StateSystem.form:
      runApp(App(stateSystem: stateSystem));
      break;
    case StateSystem.cubit:
      runApp(App(stateSystem: stateSystem));
      break;
    case StateSystem.riverPod:
      runApp(
        ProviderScope(
          child: App(stateSystem: stateSystem),
        ),
      );
      break;
    case StateSystem.provider:
      runApp(provider.ChangeNotifierProvider(
          create: (_) => FormProvider(), child: App(stateSystem: stateSystem)));
      break;
  }
}

class App extends StatelessWidget {
  const App({Key? key, required this.stateSystem}) : super(key: key);

  final StateSystem stateSystem;

  @override
  Widget build(BuildContext context) {
    Widget home;

    switch (stateSystem) {
      case StateSystem.form:
        home = const FormStateScreen();
        break;
      case StateSystem.cubit:
        home = BlocProvider<FormCubit>(
          create: (BuildContext context) => FormCubit(),
          child: const CubitScreen(),
        );
        break;
      case StateSystem.provider:
        home = provider.ChangeNotifierProvider(
            create: (_) => FormProvider(), child: const ProviderScreen());
        break;
      case StateSystem.riverPod:
        home = const RiverPodScreen();
        break;
    }
    return MaterialApp(
        title: 'Flutter State Examples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: home);
  }
}

class NoStateScreen extends StatelessWidget {
  const NoStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('No State')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            )
          ],
        ),
      ),
    );
  }
}
