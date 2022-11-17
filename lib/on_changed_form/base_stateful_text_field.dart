import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_example/theme/styles.dart';

/// Stateful TextFormField requiring an intialValue, and onChanged().
class BaseStatefulTextField extends StatefulWidget {
  const BaseStatefulTextField({
    Key? key,
    //required this.hadFocus,
    this.hintText = '',
    this.initialValue = '',
    this.inputFormatters,
    this.isRequired = false, //TODO:  implement
    this.isValidationEnabled = true,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  //final Function() hadFocus;
  final String hintText;
  final String initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final TextInputType keyboardType;
  final String label;
  final Function(String) onChanged;
  final bool isValidationEnabled;
  final FormFieldValidator? validator;

  @override
  State<BaseStatefulTextField> createState() => _BaseStatefulTextFieldState();
}

class _BaseStatefulTextFieldState extends State<BaseStatefulTextField> {
  late String _value;

  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _hadFocus = false;
  late String _label;

  @override
  initState() {
    super.initState();
    // debugPrint('BaseStatefulTextField.initState');

    _label = (widget.isRequired) ? '${widget.label}*' : widget.label;
    _focusNode = FocusNode(
      debugLabel: 'BaseSteatefulTextField',
      // onKey: (fn, rawKeyEvent) {
      //   debugPrint(
      //       'BaseStatefulTextField.focusNode.onKey(fn: $fn, rawKeyEvent: $rawKeyEvent');
      //   return KeyEventResult.handled;
      // },
      // onKeyEvent: (fn, keyEvent) {
      //   debugPrint(
      //       'BaseStatefulTextField.focusNode.onKeyEvent(fn: $fn, keyEvent: $keyEvent');
      //   return KeyEventResult.handled;
      // }
    )..addListener(_focusNodeListener);
    //focusNode.addListener(_focusNodeListener);

    _value = widget.initialValue;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    //focusNode.dispose();
    super.dispose();
  }

  void _focusNodeListener() {
    // debugPrint('focusNode.listener');
    // debugPrint('.hasFocus: ${_focusNode.hasFocus}');
    // debugPrint('.hasPrimaryFocus: ${_focusNode.hasPrimaryFocus}');
    if (_focusNode.hasPrimaryFocus) {
      _isFocused = true;
    } else {
      setState(() {
        _hadFocus = _isFocused;
        _isFocused = false;
      });
    }
  }

  String? _validate(String? value) {
    debugPrint('BaseTextField._validate(value: $value)');
    if (widget.validator == null) return null;

    return widget.validator!(value);
  }

  String? get _errorText {
    // debugPrint('BaseTextField._errorText');
    if (!widget.isValidationEnabled && !_hadFocus) return null;

    return _validate(_value);
  }

  void _onChanged(String value) {
    debugPrint('BaseTextField.TextFormField.onChanged(text: $value)');
    if (value == _value) return;

    if (widget.validator != null && widget.validator!(value) != null) {
      // is NOT valid
      widget.onChanged('');
    } else {
      // is Valid
      widget.onChanged(value);
    }

    // enables _errorText is rebuild based on the new value
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('BaseTextField.build()');
    // debugPrint('label: ${widget.label}');
    // debugPrint('validationEnabled: ${widget.isValidationEnabled}');
    // debugPrint('initialValue: ${widget.initialValue}');
    // debugPrint('_hadFocus: $_hadFocus');

    return Semantics(
      container: true,
      label: widget.label,
      hint: widget.hintText,
      textField: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          onChanged: (text) => _onChanged(text),
          // no validator required as setting the errorText in
          // the decorator runs the the validation callback
          // validator: (value) {}
          // no autovalidateMode required as the errorText is set on every build
          // autovalidateMode: widget.isValidationEnabled
          //     ? AutovalidateMode.onUserInteraction
          //     //? AutovalidateMode.always
          //     : AutovalidateMode.disabled,
          validator: widget.validator,
          decoration: Styles.buildInputDecoration(_errorText, widget.hintText, _label),
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          // TODO: investigate when to use it, and expose it.
          //textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
