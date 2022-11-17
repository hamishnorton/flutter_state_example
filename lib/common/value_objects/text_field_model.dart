class TextFieldModel {
  final String? value;
  final String? error;
  TextFieldModel(this.value, this.error);

  TextFieldModel.empty() : this(null, null);

  get isValid => (value != null && (error ?? '').isEmpty);
}
