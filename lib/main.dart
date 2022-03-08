import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod/riverpod_screen.dart';

void main() {
  // Form State && Cubit
  //runApp(const MyApp());

  // Provider
  // runApp(ChangeNotifierProvider(
  //     create: (_) => FormProvider(), child: const MyApp()));

  // RiverPod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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

      // FormState
      //home: const FormStateScreen(),

      // Provider
      // home: ChangeNotifierProvider(
      //     create: (_) => FormProvider(), child: const ProviderStateScreen()),

      // Cubit
      // home: BlocProvider<FormCubit>(
      //   create: (BuildContext context) => FormCubit(),
      //   child: const CubitStateScreen(),
      // ));

      home: const RiverPodScreen(),
    );
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
