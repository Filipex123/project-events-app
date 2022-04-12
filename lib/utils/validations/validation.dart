class Validation {

  bool requiredField(String? value) {
    return !(value == null || value == '');
  }

  bool requiredFieldDate(DateTime? value) {
    return !(value == null);
  }

  bool regExp(RegExp regExp, String? value) {
    return regExp.hasMatch(value ?? '');
  }
}