class Validator {
  static String? isName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter your name';
    }
    if (name.length < 3) {
      return 'Your name needs to be at least 3 characters long';
    }
    return null;
  }

  static String? isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Enter your email address';
    }
    if (email.length > 250) {
      return 'Use least than 251 characters';
    }

    final regexWhitespace = RegExp(r"\s");
    final regexDoublePeriod = RegExp(r"\.\.");
    final regexPattern = RegExp(
        r"^[^\@\.\s]([^\@\s]*[^\@\.\s])?@[^\@\.\s]+\.[^\@\s]*[^\@\.\s]$");

    if (regexWhitespace.hasMatch(email)) {
      return 'Whitespace is not permitted';
    }
    if (!regexPattern.hasMatch(email) || regexDoublePeriod.hasMatch(email)) {
      return 'Format is wrong';
    }
    return null;
  }

  static String? isPassword(String? password) {
    final regexPattern =
        RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{3,8}');
    if (!regexPattern.hasMatch(password ?? '')) {
      return 'Requires 3-8 chars, 1 lowercase, 1 uppercase, 1 digit, no spaces';
    }
    return null;
  }

  static String? isPhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Enter your phone number';
    }
    final regexPattern = RegExp(r'');
    if (!regexPattern.hasMatch(phone)) {
      return 'Requires digits, + or -, no spaces';
    }
    return null;
  }
}
