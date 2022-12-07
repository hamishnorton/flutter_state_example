import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  const AppForm({Key? key, required this.builder, required this.onSaved, this.validator}) : super(key: key);

  final Widget Function(AppFormState state) builder;
  final void Function(AppFormState state) onSaved;

  // Note: Allows null to be similar to Field Validators
  final String? Function()? validator;

  @override
  State<AppForm> createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;
  bool get submitted {
    debugPrint('AppFormState.submitted: $_submitted');
    return _submitted;
  }

  bool get isValid {
    final bool areFieldsValid = (_formKey.currentState != null) ? _formKey.currentState!.validate() : false;

    // final bool isFormValid = (widget.validator != null) ? (widget.validator!() ?? '').isEmpty : true;
    //return (areFieldsValid && isFormValid);
    return areFieldsValid;
  }

  String get errorText {
    if (!submitted) return '';
    if (widget.validator == null) return '';
    return widget.validator!() ?? '';
  }

  bool submit() {
    debugPrint('AppFormState.submit()');
    setState(() {});
    _submitted = true;
    if (isValid) {
      debugPrint('if (isValid): true');
      widget.onSaved(this);
    }
    //});

    return isValid;
  }

  @override
  Widget build(final BuildContext context) {
    debugPrint('AppFormState.build()');
    return Form(
      key: _formKey,
      child: widget.builder(this),
    );
  }
}
