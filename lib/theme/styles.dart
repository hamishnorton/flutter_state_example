import 'package:flutter/material.dart';

class Styles {
  static InputDecoration buildInputDecoration(
    String? errorText,
    String? hintText,
    String? label,
  ) {
    return InputDecoration(
      errorText: errorText,
      hintText: hintText,
      label: (label != null) ? Text(label) : null,
      counterText: '',
      suffixIcon: (errorText != null)
          ? const Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(
                Icons.warning,
                color: Colors.red,
              ))
          : null,
    );
  }
}
