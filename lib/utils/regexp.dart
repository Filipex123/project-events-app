class RegExpValidations {
  static RegExp name = RegExp(r'^\w+\s\w+$', caseSensitive: false);
  static RegExp email = RegExp(r'^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$', caseSensitive: false);
}