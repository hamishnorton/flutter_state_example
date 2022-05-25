import 'package:flutter/material.dart';
import 'widgets/riverpod_form.dart';

class RiverPodScreen extends StatelessWidget {
  const RiverPodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('stateSystem: RiverPod')),
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.all(8.0), child: RiverPodForm()),
      ),
    );
  }
}
