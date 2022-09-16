class PasswordValidator<public> {
  static String validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return validatePassword(value);
      }
    }
  }
}

class SpaceValidators<public> {
  static String validateSpace(String value) {
    if (value.contains(' ')) {
      return "contain space";
    } else {
      return "";
    }
  }
}
