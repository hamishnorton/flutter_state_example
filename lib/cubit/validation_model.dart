class ValidationModel {
  final String? value;
  final String? error;
  ValidationModel(this.value, this.error);

  get isValid => (value != null && (error ?? '').isEmpty);
}
