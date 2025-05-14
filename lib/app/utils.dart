class AppUtils {
  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool passwordMatch(String password, String confirmPassword) {
    return password.isNotEmpty && (password == confirmPassword);
  }
}

extension EmailValidation on String {
  bool validateEmail() {
    return AppUtils.isEmailValid(this);
  }
}

extension StringFormatValidation on String {
  bool hasMinLength(int length) => this.length >= length;
  bool hasNumber() => contains(RegExp(r'[0-9]'));
}
