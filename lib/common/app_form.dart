import 'package:flutter/widgets.dart';

class AppForm extends StatefulWidget {
  const AppForm(
      {Key? key, required this.builder, required this.onSaved, this.validate})
      : super(key: key);

  final Widget Function(AppFormState state) builder;
  final void Function(AppFormState state) onSaved;
  // TODO: Add a form specific validation message
  final bool Function()? validate;

  @override
  State<AppForm> createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;
  bool get submitted {
    //debugPrint('AppFormState.submitted: $_submitted');
    return _submitted;
  }

  bool validate() {
    //('AppFormState.validate()');
    //TODO: doesn't run the widget.validate
    return _formKey.currentState!.validate();
  }

  bool submit() {
    //debugPrint('AppFormState.submit()');
    final isValid = (widget.validate != null)
        ? validate() && widget.validate!()
        : validate();
    if (isValid) widget.onSaved(this);

    setState(() {
      _submitted = true;
    });
    return isValid;
  }

  @override
  Widget build(final BuildContext context) {
    //debugPrint('AppFormState.build()');
    return Form(
      key: _formKey,
      child: widget.builder(this),
    );
  }
}
