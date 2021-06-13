import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuthen {
  FirebaseAuth _fireBaseAuthen = FirebaseAuth.instance;

  void signup(String email, pass, name, phone, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuthen
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) => {
              print(user),
              _createUser(user.user!.uid, name, phone, onSuccess, onSignInError)
            })
        .catchError((error) {
      //
      print(error);
      _onSignUpError('email-already-in-use', onSignInError);
    });
  }

  _createUser(String userId, String name, String phone, Function onSussess,
      Function(String) onSignInError) {
    print("_createUser " + userId);
    var userDict = {'user': name, 'phone': phone};

    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(userDict).catchError((error) {
      _onSignUpError(error.code, onSignInError);
    }).then((user) => {onSussess()});
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuthen
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) => {onSuccess()})
        .catchError((error) {
      _onSignUpError('login-error', onSignInError);
    });
  }

  void _onSignUpError(String code, Function(String) onRegisterError) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError('Invalid email');
        break;
      case 'email-already-in-use':
        onRegisterError('Email has existed');
        break;
      case 'login-error':
        onRegisterError('Login error, please try again!');
        break;
      default:
        onRegisterError('SignUp failed, please try again!');
        break;
    }
  }
}
