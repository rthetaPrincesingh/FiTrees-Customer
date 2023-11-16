bool isValidEmail(String email) {
  // Define a regular expression pattern for a valid email address
  RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  // Use the RegExp `hasMatch` method to check if the email matches the pattern
  return emailRegExp.hasMatch(email);
}
