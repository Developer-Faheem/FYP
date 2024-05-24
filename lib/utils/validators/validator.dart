class SValidators {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName field is Required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Required.';
    }

    //regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required.';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    //check for the upper case charachter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase character';
    }

    //check for the numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    //check for the special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validatePhnNumber(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is Required.';
    }

    // Pakistani phone number format regex
    final pakPhnRegExp = RegExp(
        r"^(?:\+92)?(03[0-9]{9}|01[0-9]{9}|02[1-9]{8}|04[0-9]{8}|05[1-5]{8}|06[1-9]{8}|07[0-9]{8}|08[1-9]{8}|09[0-9]{8})$");

    if (!pakPhnRegExp.hasMatch(value)) {
      return 'Invalid phone No format ';
    }

    return null;
  }
}
