import 'package:flutter/material.dart';

import 'widgets/riverpod_form.dart';

class RiverPodScreen extends StatefulWidget {
  const RiverPodScreen({Key? key}) : super(key: key);

  @override
  State<RiverPodScreen> createState() => _RiverPodScreenState();
}

class _RiverPodScreenState extends State<RiverPodScreen> {
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
      appBar: AppBar(title: const Text('RiverPod State')),
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.all(8.0), child: RiverPodForm()),
      ),
    );
  }
}
