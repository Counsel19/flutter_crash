
class CustomValidators {
  static String? fieldValidator(RegExp regexInput, String? value, String field) {
  if (value != null && regexInput.hasMatch(value)) {
    return null;
  }
  return "Enter a valid $field";
}
}