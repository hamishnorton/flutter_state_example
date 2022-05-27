import 'package:flutter/widgets.dart';

class AppForm extends StatefulWidget {
  const AppForm({Key? key, required this.builder, required this.onSaved})
      : super(key: key);

  final Widget Function(AppFormState state) builder;
  final void Function(AppFormState state) onSaved;

  @override
  State<AppForm> createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;
  bool get submitted {
    debugPrint('submitted: $_submitted');
    return _submitted;
  }

  bool validate() => _formKey.currentState!.validate();

  void submit() {
    // applies _submitted to the forms widgets
    setState(() {
      _submitted = true;
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        widget.onSaved(this);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.builder(this),
    );
  }
}
