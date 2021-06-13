import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuthen {
  FirebaseAuth _fireBaseAuthen = FirebaseAuth.instance;

  void signup(String email, pass, name, phone, Function onSuccess) {
    _fireBaseAuthen
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) =>
            {print(user), _createUser(user.user!.uid, name, phone, onSuccess)})
        .catchError((error) {
      //
      print(error);
    });
  }

  _createUser(String userId, String name, String phone, Function onSussess) {
    print("_createUser " + userId);
    var userDict = {'user': name, 'phone': phone};

    var ref = FirebaseDatabase.instance.reference().child("users");
    ref
        .child(userId)
        .set(userDict)
        .catchError((error) {})
        .then((user) => {onSussess()});
  }
}
