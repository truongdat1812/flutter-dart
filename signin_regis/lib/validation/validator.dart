class Validators {
  static bool isValidUser(String? user) {
    return user != null && user.length > 0 && user.contains("@");
  }

  static bool isValidPassword(String? password) {
    return password != null && password.length > 6;
  }
}
