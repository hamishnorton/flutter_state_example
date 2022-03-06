import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_example/cubit/cubit_state_screen.dart';
import 'package:flutter_state_example/cubit/form_cubit.dart';

void main() {
  runApp(const MyApp());

  // runApp(ChangeNotifierProvider(
  //     create: (_) => FormProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter State Examples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const FormStateScreen(),
        // home: ChangeNotifierProvider(
        //     create: (_) => FormProvider(), child: const ProviderStateScreen()),
        home: BlocProvider<FormCubit>(
          create: (BuildContext context) => FormCubit(),
          child: const CubitStateScreen(),
        ));
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
