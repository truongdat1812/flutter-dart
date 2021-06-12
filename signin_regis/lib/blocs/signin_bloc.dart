import 'dart:async';

import 'package:signin_regis/validation/validator.dart';

class LoginBloc {
  StreamController _userControler = new StreamController();
  StreamController _passwordControler = new StreamController();

  Stream get userStream => _userControler.stream;
  Stream get passwordStream => _passwordControler.stream;

  bool isValidInfo(String? user, String? password) {
    if (!Validators.isValidUser(user)) {
      _userControler.sink.addError('Invalid username!');
      return false;
    }
    _userControler.sink.add("OK");

    if (!Validators.isValidPassword(password)) {
      _passwordControler.sink.addError('Invalid password!');
      return false;
    }

    _passwordControler.sink.add("OK");
    return true;
  }

  void dispose() {
    _userControler.close();
    _passwordControler.close();
  }
}
