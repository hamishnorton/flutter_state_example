class ValidationModel {
  final String? value;
  final String? error;
  ValidationModel(this.value, this.error);

  ValidationModel.empty() : this(null, null);

  get isValid => (value != null && (error ?? '').isEmpty);
}
